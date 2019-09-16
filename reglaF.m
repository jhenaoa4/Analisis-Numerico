function y = reglaF(xa,xb,tol,nMax)
f = @(x) log((sin(x))^2 + 1)-1/2;
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
xA=[xa];
xB=[xb];
xM=[xm];
fxM=[fxm];
vErr=[error];
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
     xA(i)=[xa];
     xB(i)=[xb];
     xM(i)=[xm];
     fxM(i)=[fxm];
     vErr(i)=[error];
end
if xm == 0
    %dips(xm)
    xB
    xM
    fxM
    vErr
else if error < tol
        xB
        xM
        fxM
        vErr
        disp('es una aproximación a la raíz')
else 
        disp('fracasó en ') 
        disp(nMax)
    end
end
        end
end
end