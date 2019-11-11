function y=invPermCod(c,k,n)
p=invKey(k);
aux=c;
for i=1:n
    c(i)=aux(p(i));
end
y=c;
end