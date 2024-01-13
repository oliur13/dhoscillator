clear all;
% %% we'll setup our own solver such that it functions like MathLabs solver
% %%  [t,y] = solver(fun,tspan,y0,options)
% % t is a column vector of time points
% %  y is the solution array
% 
% %% define the system of ODEs as an external function fun(t,y) that actually calls ddho

h = pi/200;
Trng = [0,50];  %%% range 
ICs = [3; 0] ; %%% initial conditions
plotopts = {};
G = 3;


skip=20;
options = odeset('RelTol',1e-16);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% MATLABS ODE45 solver %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[tSOLN,ySOLN] = ode45(@ddho,Trng(1):h/skip:Trng(2),ICs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%   NOW RUN OUR RK4G code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lentrng = length(Trng(1):h:Trng(2));
yRK =zeros(5,lentrng,2);
errRK = zeros(5,lentrng,2);

method = 3;
%%% tests method 3
[tRK,yRK(method,:,:)] = RK4G(@ddho,Trng,ICs,h,method);
errRK(method,:,:) = yRK(method,:,:) -reshape(ySOLN(1:skip:end,:),1,lentrng,2);


figure(1)

plot(tRK, yRK(:,:,1),tSOLN,ySOLN(:,:,1),'-x')
%title(['h = ',num2str(h)]);
xlabel('time t');
legend('RK3','ODE45')
title("Y1 - Position")

figure(2)
plot(tRK, yRK(:,:,2),tSOLN,ySOLN(:,:,2),'-x')
%title(['h = ',num2str(h)]);
xlabel('time t');
legend('RK3','ODE45')
title("Y2 - Velocity")
%
figure(3)
plot(tRK, log10(abs(errRK(:,:,1))))
%title(['h = ',num2str(h)]);
xlabel('time t');
ylabel('$Log_{10}$($\Delta$ Soln)','Interpreter','Latex');
%legend('eRK3')
title("Error Y1")

