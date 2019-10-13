function vecValPropios(M,n)
v=poly(M)
valores=roots(v)
id=eye(n);
for i=1:length(valores)
    i
    t = M-(real(valores(i))*id);
    null(t, 'r')
end
end