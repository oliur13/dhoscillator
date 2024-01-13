clear all;
% %% we'll setup our own solver such that it functions like MathLabs solver
% %%  [t,y] = solver(fun,tspan,y0,options)
% % t is a column vector of time points
% %  y is the solution array
% 
% %% define the system of ODEs as an external function fun(t,y)
%%% 
% %%% in this simple example y = (y1,y2)
% %%%       with y = ( sin(t), cos(t) ) 

%%% so what is the ANALYTIC SOLUTION?

%%% NOw solve it usign ODE45 a system call


%% common configuration

h = 0.1;
Trng = [0,10];  %%% range 
ICs = [3,0 ] ; %%% initial conditions
plotopts = {};

ODE = @fun;
profile on;
[t,y] = ode45(@fun,Trng,ICs);
[t2,y2]=RK3G(@fun,Trng,ICs',h);

plot(t,y,'-x',t2,y2,'-o')
title(['ODE45, h = ',num2str(h)]);
xlabel('time t');
ylabel('solution y');
legend('ODE45.1','ODE45.2','RK3.1','RK3.2')



