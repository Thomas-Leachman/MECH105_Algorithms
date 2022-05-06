function [I] = Simpson(x, y)
[m,nX]=size(x);
[m,nY]=size(y);
if (nX ~= nY)
    error('data is not equal');
end
if (nX < 2)
    warnStruct = trapz(x, y)
    warning(warnStruct);
end
h = x(2) - x(1);
for i=3:nX
    if (x(i)-x(i-1)) ~= h
        error('x must be equally spaced');
    end
end
sum = y(1);
for i=2:(nX-2)
    if mod(i,2)==0
        sum=sum+4*y(i);
    else
        sum=sum+2*y(i);
    end
end
if mod(nX,2) == 0
disp('Trap rule needs to be used on last interval');
sum = sum + y(nX-1);
I = (sum*h/3) + ((y(nX) + y(nX-1))*h/2);
else
sum = sum + 4*y(nX-1) + y(nX);
I=sum*h/3;
end
disp(I);
end
