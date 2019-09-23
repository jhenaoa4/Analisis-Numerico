function [tabla] = puntoFijo(tol,x0,nMax)
format long
%%Open
%%ErrorRelativo
% tabla: iteracion x fx error alfa
f = @(x) exp(-x)-sin(4*x)-7*x^2;
g = @(x) -log(sin(4*x)+7*x^2);
fx0 = f(x0);
i = 0;
error0 = tol + 1;
tabla(1,1)=0; %%tabla iteraciones
tabla(1,2)=x0;
tabla(1,3)=fx0;
while fx0 ~= 0 && error0 > tol && i < nMax
    xn = g(x0);
    fx0 = f(xn);
    error1 = abs((xn-x0)/xn);
    alfa=error1/error0;
    error0=error1;
    x0 = xn;
    i = i+1;
    tabla(i+1,1)=i; %%tabla iteraciones
    tabla(i+1,2)=x0;
    tabla(i+1,3)=fx0;
    tabla(i+1,4)=error1;
    %%tabla(i+1,5)=alfa;
end
if fx0 == 0 
    disp(x0)
    disp('es raíz')
else if error0 < tol
        disp(x0)
        disp('es una aproximación a la raíz')
    else 
        disp('el metodo fracasó')
    end
end
end