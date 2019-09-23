function [tabla]=metodoSecante(x0,x1,tol,niter)
%%open
%%error abs
format long
f = @(x) exp(x)-(5*x)+2;

fx0 = f(x0);
if fx0 == 0
    disp(x0);
else
    fx1 = f(x1);
    cont = 0;
    error = tol+1;
    den = fx1-fx0;
    while error > tol && fx1 ~= 0 && den ~= 0 && cont < niter
        x2 = x1 - fx1*(x1-x0)/den;
        error = abs(x2-x1);
        x0 = x1;
        fx0 = fx1;
        x1 = x2;
        fx1 = f(x1);
        den = fx1-fx0;
        cont = cont +1;
        tabla(cont,1)=cont;
        tabla(cont,2)=x1;
        tabla(cont,3)=f(x1);
        tabla(cont,4)=error;
    end
    if fx1 == 0
        disp(x1);
    elseif error < tol
            disp(x1);
            disp("es aproximación a una raíz");
    elseif den == 0
        disp("hay posible raiz múltiple");
    else
        fprintf("fracasó en %i iteraciones", niter);
    end
end
end