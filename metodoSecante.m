function metodoSecante(x0,x1,tol,niter)
f = @(x) log((sin(x))^2 + 1)-1/2;
fx0 = f(x0);
if fx0 == 0
    disp(x0);
else
    fx1 = f(x1);
    cont = 0;
    error = tol+1;
    den = fx1-fx0;
    vecX0=[x0];
    vecX1=[x1];
    vecFx1=[fx1];
    vecErr=[];
    while error > tol && fx1 ~= 0 && den ~= 0 && cont < niter
        x2 = x1 - fx1*(x1-x0)/den;
        error = abs(x2-x1);
        x0 = x1;
        fx0 = fx1;
        x1 = x2;
        fx1 = f(x1);
        den = fx1-fx0;
        cont = cont +1;
        vecX0(cont)=[x0];
        vecX1(cont)=[x1];
        vecFx1(cont)=[fx1];
        vecErr(cont)=[den];
    end
    if fx1 == 0
        %disp(x1);
        vecX0
        vecX1
        vecFx1
        vecErr
    elseif error < tol
        %disp(x1);
        vecX0
        vecX1
        vecFx1
        vecErr
        disp("es aproximación a una raíz");
    elseif den == 0
        disp("hay posible raiz múltiple");
    else
        fprintf("fracasó en %i iteraciones", niter);
    end
end