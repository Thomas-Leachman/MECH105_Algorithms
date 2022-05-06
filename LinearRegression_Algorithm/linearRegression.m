function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination


%Outliers 
n1=length(x);
n2=length(y);
if n1~=n2
    error('inputs do not match')
end
[sortedY, sortorder]=sort(y);
sortedX=sortorder(x);
n=numel(x);
Q1=floor((n+1)/4);
Q3=floor((3*n+3)/4);
y1=y(Q1);
y2=y(Q3);
IQR=y2-y1;
for i=1:n
    if sortedY(i)>=Q1-1.5*IQR && sortedY(i)<=Q3+1.5*IQR
        ynew(i)=sortedY(i);
        xnew(i)=sortedX(i);
    end
end
fY=ynew;
fX=xnew;
fn=numel(fX);

%Linear Regression
xiyi = sum(fX.*fY);
yi = sum(fY);
xi2 = sum(fX.^2);
xi = sum(fX);
a1 = (fn*(xiyi)-(xi*yi))/(fn*(xi2)-(xi^2));
k = mean(fX);
u = mean(fY);
a0 = u-a1*k;
slope = a1;
intercept = a0;

%R^2
S_T = sum((fY-u).^2);
S_R = sum(fY-((a1.*fX)+a0).^2);
Rsquared = 1-(S_R/S_T);

end
