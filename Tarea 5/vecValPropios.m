function vecValPropios(M,n)
format long
v = poly(M)
valores = roots(v)
id=eye(n);
for i=1:length(valores)
    i
    me=real(valores(i));
    yid=me*id;
    m=M-yid;
    null(m)
end
end