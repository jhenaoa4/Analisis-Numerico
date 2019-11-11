function y=permCod(c,k,n)
%este codigo permuta la cadena c con la clave k
aux=c;
for i=1:n
    c(i)=aux(k(i));
end
y=c;
end