#{
	This function shows Bang Bang Control
	c is the magical constant
	m is mass of the car
	r is expected output
	
	u = Umax (if e > 0); -Umax (if e < 0) ; 0 (if e = 0)
	
	Using model as suggested by Vito WU
	x' = c/m*u-k*x
#}

function [controlInput, controlOutput] = bangBangControlWithResistance(totalSamples, c , m, r)
	#u is the input that we are going to design
	Umax = 100;
	magicConstant = c/m; #from the lecture
	
	#this is random constant, feel free to play with it
	dT = 0.001;
	
	#k is some resistance constant
	k = 0.3;
	
	controlOutput = 0; # this is x
	controlInput = 0; # this is u
	
	if(nargin != 4)
		error("Invalid Input Parameter");
		return;
	endif
	
	controlOutput(1) = 0; #start with zero
    
    for i = 1:totalSamples
		#e is error
		e = r - controlOutput(i) ;
		
		#for finding u - bang-bang input
		if(e > 0) 
			u = Umax;
		elseif( e < 0) 
			u = -Umax;
		else
			u=0;
		endif
		
		controlInput(i) = u;
	        #RK-4
	        
	        #calculate A
	        A = dT * (magicConstant * u - k * controlOutput(i));
        	#calculate B
        	controlOutput_temp(i+1)=controlOutput(i)+A;
	        if(controlOutput_temp(i+1)<r)
	            u=100;
	        elseif(controlOutput_temp(i+1)>r)
	            u=-100;
	        else
	            u=0;
	        endif
	        B = magicConstant * u - k * controlOutput_temp(i+1);
	        #calculate C
	        controlOutput_temp(i+2)=controlOutput_temp(i+1)+0.5*(A+B)*dT;
	        if(controlOutput_temp(i+2)<r)
	            u=100;
	        elseif(controlOutput_temp(i+2)>r)
	            u=-100;
	        else
	            u=0;
	        endif
	        C=magicConstant * u - k * controlOutput_temp(i+2);
	        #calculate D
	        controlOutput_temp(i+3)=controlOutput_temp(i+2)+(1/3)*(A+B+C)*dT;
	        if(controlOutput_temp(i+3)<r)
	            u=100;
	        elseif(controlOutput_temp(i+3)>r)
	            u=-100;
	        else
	            u=0;
	        endif
	        D=magicConstant * u - k * controlOutput_temp(i+3);
	        
	        controlOutput(i+1) = controlOutput(i) + dT * (A+2*B+2*C+D)*(1/6);

		#controlOutput(i+1) = controlOutput(i) + dT * (magicConstant * u
							#- k * controlOutput(i));
		controlInput(i+1) = 0;
    endfor
endfunction
