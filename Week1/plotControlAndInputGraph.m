#this file contains functions which can be used to plot graphs

function plotControlAndInputGraph(controlVariables, timeBase, inputVariables)
	if(nargin == 1)
		plot(controlVariables);
	elseif(nargin ==2)
		plot(timeBase, controlVariables);
	elseif(nargin == 3)
		subplot(2, 1,1)
		plot(timeBase,controlVariables)
		subplot(2, 1,2)
		plot(timeBase,inputVariables)
	else
		error("Invalid Input Parameter!");
	endif
endfunction
