function biseccion1(xa,xb,tol,nMax)
f = @(x) log((sin(x))^2 + 1)-1/2;
fxa = f(xa);
fxb = f(xb);

if fxa == 0 
    disp(xa)
else if fxb == 0
    disp(xb)
else 
    xInf=[xa];
    xSup=[xb];
    xM=[];
    fxM=[];
    vErr=[];
    xm = (xa+xb)/2;
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
    xInf(i)=[xa];
    xSup(i)=[xb];
    xM(i)=[xm];
    fxM(i)=[fxm];
    vErr(i)=[error];
 aux = xm;
 xm = (xa+xb)/2;
 fxm = f(xm);
 error = abs(xm-aux);
 i = i + 1;
end
if xm == 0
    %dips(xm)
    xInf
    xSup
    xM
    fxM
    vErr
else if error < tol
        %disp(xm)
        disp('es una aproximación a la raíz')
        xInf
    xSup
    xM
    fxM
    vErr
else 
        disp('fracasó en ') 
        disp(nMax)
    end
end
        end
    end
end



        
        
        
        