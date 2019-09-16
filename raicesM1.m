function raicesM1(x0,tol,nIter)
syms x;
f = @(x) exp(x)-x-1;
fp = matlabFunction(diff(f(x)));
f2p = matlabFunction(diff(fp(x)));
error = 1; %%No se cambia
i = 0;
vecF=[];
vecFp=[];
vecF2p=[];
vecErr=[];
while i < nIter && error > tol
fx = f(x0);
fpx = fp(x0);
f2px = f2p(x0);
x = x0 - (fx*fpx)/((fpx^2)-fx*f2px);
disp("Raíz en: ");
disp(x);
error = abs(x - x0);
i = i + 1;
vecF(i)=[fx];
vecFp(i)=[fpx];
vecF2p(i)=[f2px];
vecErr(i)=[error];
x0 = x;
end 
vecF
vecFp
vecF2p
vecErr
end

