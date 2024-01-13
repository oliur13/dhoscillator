function dydt = fun(t,y)
%% pick from the following sets of ODEs

% Simple sin/cosine Test Functions
%% returns a vector dy/dt evaluated at t
%%% y,y' = y(2), y(1) ->  y'' = y is the 2nd order ODE


%% Oscilator with damping...
    %% y'' = -w^2 y - 2g wy'
    %%% w = frequency
    %%  g = damping coefficient
    w = 2.0;
    g = 0.1;  %% if g = 0 then same as undamped
%%dydt = [ y(2); - w^2 *y(1) ];    %% y'' = -w^2 y 
dydt = [ y(2) ; -w^2 * y(1) - 2*g*w*y(2) ] ; %% y'' = - w^2y - 2gwy'
