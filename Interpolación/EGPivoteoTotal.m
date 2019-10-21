function x=EGPivoteoTotal(A,b,n)
Ab= [A,b];
for k=1: (n)
    Ab = pivoteoParcial(Ab,n,k);
    for i=k+1: n
       mult= Ab(i,k)/ Ab(k,k) ;
       for j= k :n+1
           Ab(i,j)= Ab(i,j)- (mult*Ab(k,j));
       end
    end
end
%y= Ab;

%%Sustitucion Regresiva
x(n)=Ab(n,n+1)/Ab(n,n);
for i=(n-1):-1:1
    sum=0;
    for p=i+1:n
        sum=sum+(Ab(i,p))*x(p);
    end
    x(i)=(Ab(i,n+1)-sum)/Ab(i,i);
end

end