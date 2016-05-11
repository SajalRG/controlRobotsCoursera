#this file contains functions which can be used to plot graphs

function plotControlAndInputGraph(outputVariables, timeBase, inputVariables)
	if(nargin == 1)
		plot(outputVariables);
		axis([0,10, 0, 80]); 
		axis "autox";
		xlabel("t");
		ylabel("x");
		title("Output Signal");
	elseif(nargin ==2)
		plot(timeBase, outputVariables);
		axis([0,10, 0, 80]); 
		axis "autox";
		xlabel("t");
		ylabel("x");
		title("Output Signal");
	elseif(nargin == 3)
		subplot(2, 1,1)
		plot(timeBase,outputVariables)
		axis([0,10, 0, 80]); 
		axis "autox";
		xlabel("t");
		ylabel("x");
		title("Output Signal");
		subplot(2, 1,2)
		plot(timeBase,inputVariables)
		xlabel("t");
		ylabel("u");
		title("Control Signal Input");
	else
		error("Invalid Input Parameter!");
	endif
endfunction
