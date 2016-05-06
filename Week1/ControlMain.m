#{ 
	this is the control design
	our control model is x' = c/m * u
	we want x -> r as t goes to infinity
	u is the input and e is error which is r -x . r is expected value
#}

# t is continuous time variable
dT = 0.001;
totalSamples = 100;
Tfinal = dT * totalSamples;
t = 0:dT:Tfinal;

#c is magical input constant F = c * u
c = 1;

#m is mass of the vehicle + passengers + goods
m = 1;

#r is expected value
r = 70;

#using bang-bang control
[x, uArray] = bangBangControl(totalSamples, c , m, r);

#plotting the graph
plotControlAndInputGraph(x,t, uArray);

pause(60);
