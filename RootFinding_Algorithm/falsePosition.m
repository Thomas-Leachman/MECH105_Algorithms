function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)


if nargin < 3
    error('not enough iputs')
end
if nargin < 4
    es = .0001;
    maxit = 200;
end
if nargin < 5 
   maxit = 200;
end

ea = 100;
iter = 0;
xrold = 1;

while ea > es

    xr = xu - (func(xu)*(xl - xu))/(func(xl)-func(xu));
    ea = abs((xrold - xr)/xr)*100;
    xrold = xr;
    xl = xr;
    iter = iter + 1;
end
root = xr;
iter = iter-1;
fx = func(xr);


