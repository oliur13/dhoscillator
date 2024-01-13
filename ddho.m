function dydt = ddho(t,y)
%% Oscilators
    %% y'' = -wo^2 y - 2g wo y' + d;
    %%% w = frequency
    %%  g = damping coefficient
    %%  d = driving term... should be a function
    wo = 2;
    g = 0.1 ;
    A = 3;
    d = A*cos(5.00*t) ;
%%dydt = [ y(2); - w^2 *y(1) ];    %% y'' = -w^2 y 
dydt = [ y(2) ; -wo^2 * y(1) - 2*g*wo*y(2) + d ] ; %% y'' = - w^2y - 2gwy' + d
