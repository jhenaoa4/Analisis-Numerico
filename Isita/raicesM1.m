%% raices múltiples
f = @(x) exp((-x^2)+1)+x*sin(x-3)-x;
fp = @(x) -2*exp((-x^2)+1)*x+x*cos(x-3)-1+sin(x-3);
f2p = @(x) -4*exp((-x^2)+1)*(x^2)-x*sin(x-3)-2*exp((-x^2)+1)+2*cos(x-3);
x0 = -20;
nIter = 100;
tol = 0.5*10^-8;
error = 1;
i = 0;
fplot(f,[-20,20])
grid on
while i < nIter && error > tol

fx = f(x0);
fpx = fp(x0);
f2px = f2p(x0);
x = x0 - (fx*fpx)/((fpx^2)-fx*f2px);
    disp(x)

error = abs(x - x0);
x0 = x;
i = i + 1;
end 
disp('error:')
disp(error)

