function x = sustitucionRegresiva(Ab,n)
% xn=Ab(n,n+1)/Ab(n,n);
for i=n-1:-1:1
    sumatoria=0;
    for p=i+1:n
        xp = Ab(p,p+1)/Ab(p,p);
        sumatoria=sumatoria + Ab(i,p)*xp;
    end
    xi = (Ab(i,n+1)-sumatoria)/Ab(i,i);
end
x=xi;
end