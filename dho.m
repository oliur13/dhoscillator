function dydt = dho(t,y)
%% Oscilators
    %% y'' = -w^2 y - 2g wy'
    %%% w = frequency
    %%  g = damping coefficient
    w = 1.0;
    g = 0.;  %% if g = 0 then same as undamped
    d = 0;
%%dydt = [ y(2); - w^2 *y(1) ];    %% y'' = -w^2 y 
dydt = [ y(2) ; -w^2 * y(1) - 2*g*w*y(2) + d ] ; %% y'' = - w^2y - 2gwy' + d
