#{
	This function shows P regulator
	c is the magical constant
	m is mass of the car
	r is expected output
	
	u = ke; e = r - x
	k is proportional constant
#}

function [controlOutput] = pControlWithoutWind(totalSamples, c , m, r)
	#u is the input that we are going to design
	magicConstant = c/m; #from the lecture
	
	# k is proportionality constant
	k = 0.2;
	
	#this is random constant, feel free to play with it
	dT = 1;
	
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
		
		#for finding u - p input
		u = k * e;
		
		controlOutput(i+1) = controlOutput(i) + dT * magicConstant * u;
    endfor
endfunction
