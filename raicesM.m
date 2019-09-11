%% raices múltiples
f = @(x) sqrt(((e^0)/(e^(x*cos(6x+3)-3*x-10))-1);
fp = @(x) -6*x*sin(6*x+3)+((2*x-3*((x^2)+1))/((x^2)+1))+cos(6*x+3);
f2p = @(x) -36*x*cos(6*x+3)+((((x^2)+1)*(2-6*x)-4*(x^2)+6*(x^3)+6*x)/(((x^2)+1)^2)-12*sin(6*x+3));
x0 = -1.999999970197678;
nIter = 100;
error = 1;
i = 0;
while i < nIter

fx = f(x0);
fpx = fp(x0);
f2px = f2p(x0);
x = x0 - (fx*fpx)/((fpx^2)-fx*f2px);
    disp(x)

error = abs(x - x0);
x0 = x;
i = i + 1;
end 

