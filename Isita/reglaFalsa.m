function [tabla]=reglaFalsa(a,b,tol,nMax)
%close
%%vec= ['Iteración' xinf xsup 'x' 'f(x)' 'error'];
%%ErrorAbs
format long
i=0;
error0=tol+1;
q=a;
f= @(x) log((sin(x))^2 + 1) - 1/2 ;
while i<nMax && error0>tol
    i=i+1;
    tabla(i,1)=i;
    tabla(i,2)=a;
    tabla(i,3)=b;
    x=b-(f(b)*(b-a))/(f(b)-f(a));
    tabla(i,4)=x;
    y=f(x);
    tabla(i,5)=y;
    error1=abs(x-q);
    alfa=error1/error0
    error0=error1;
    tabla(i,6)=error1;
    tabla(i,7)=alfa;
    if f(a)*f(x)<0
        b=x;
    else
        a=x;
    end
    q=x;
end
end