function [t,y] = RK4G(ode,t,yo,h,G)
%%Generalize Runge-Kutta method
%% G = 2 is "classic RK4"
%%  G = 1, 3,4,5  are other methods
%%%   actually any real value  1<G<5 seems to work
if(~exist('G','var'))
    G = 2;
elseif ((G > 5) ||(G < 1 ))
    fprintf('\n\n\n');
    fprintf('%s\n','*****************');
    fprintf('%s\n','ERROR: RK4G: G not acceptable  G =1,2,3,4,5');
    fprintf('%s\n',   ' Overiding with G = 2, traditional RK4 method');
    fprintf('%s\n','******************');
    fprintf('\n\n\n');
    G = 2;
end

sprintf("G is %d with step h= %f",G, h)
y = yo;
yout = yo;
tout = t(1);
for i = t(1): h : t(2)-h
      k1  = ode(i,y);
      k2  = ode(i+h/2, y + h/2 * k1);
      k3  = ode(i+h/2, y + (1/2 - 1/G)*h*k1 + h/G*k2);
      k4  = ode(i+h,   y + (1-G/2)*h*k2     + G*h/2*k3);
     y = y + h/6*(k1 + (4-G)*k2 + G*k3 + k4);
        yout = [yout,y]; 
        tout = [tout;i+h];
end
t = tout;
y = yout';
end


  