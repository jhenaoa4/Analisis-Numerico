function y = reglaF(xa,xb,tol,nMax)
f = @(x) exp(3*x-12)+x*cos(3*x)-(x^2)+4;
fxa = f(xa);
fxb = f(xb);

if fxa == 0 
    disp(xa)
else if fxb == 0
    disp(xb)
else 
xm = xa-(((fxa)*(xb-xa))/(fxb-fxa));
fxm = f(xm);
i = 1;
error = tol + 1;
     while error > tol && fxm ~= 0 && i < nMax
      if fxa*fxm < 0
        xb = xm;
        fxb = fxm;
    else 
        xa = xm;
        fxa = fxm;
    end
 aux = xm;
 xm = xa-(((fxa)*(xb-xa))/(fxb-fxa));
 fxm = f(xm);
 error = abs(xm-aux);
 i = i + 1;
end
if xm == 0
    dips(xm)
else if error < tol
        disp(xm)
        disp('es una aproximación a la raíz')
else 
        disp('fracasó en ') 
        disp(nMax)
    end
end
        end
end
end