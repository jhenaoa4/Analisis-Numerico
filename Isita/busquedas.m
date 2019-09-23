function y = busquedas (x0,delta,nMax)
f = @(x) exp((-x^2)+4)+3*cos(x-3)-2*x+16;
fx0 = f(x0);
fplot(f,[-20,20])
grid on
if fx0 == 0
    disp(x0)
    disp('Es raíz')
else
    x1 = x0 + delta;
    i = 1;
    fx1 = f(x1);
    while fx0*fx1 > 0 && i < nMax
        x0 = x1;
        fx0 = fx1;
        x1 = x0+delta;
        fx1 = f(x1);
        i = i+1;
    end
    if fx1 == 0
        dips(x1)
        disp('es raíz')
    else if fx0*fx1 < 0
            disp('hay raíz entre')
            disp(x0)
            disp(x1)
        else
            disp('fracasó en ')
            disp(nMax)
        end
    end
end
end
