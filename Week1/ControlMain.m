#{ 
	this is the control design
	our control model is x' = c/m * u
	we want x -> r as t goes to infinity
	u is the input and e is error which is r -x . r is expected value
#}

# t is continuous time variable
dT = 0.1;
totalSamples = 100;
Tfinal = dT * totalSamples;
t = 0:dT:Tfinal;

#c is magical input constant F = c * u
c = 1;

#m is mass of the vehicle + passengers + goods
m = 1;

#r is expected value
r = 70;

#uncomment below to use bang-bang control
#[uArray, x] = bangBangControl(totalSamples, c , m, r);
#plotControlAndInputGraph(x,t, uArray);

#uncomment below to use pControlWithoutWind
#x = pControlWithoutWind(totalSamples, c , m, r);
#plotControlAndInputGraph(x,t);

#uncomment below to use pControlWithWind i.e. model with wind resistance
x = pControlWithWind(totalSamples, c , m, r);
plotControlAndInputGraph(x,t);

pause(60);
