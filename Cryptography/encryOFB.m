function y=encryOFB(B,k,n,r,I)
E=[];
Z=I;
[row col]=size(B);
for i=1:row
    M=permCod(Z,k,r);
    Z=M;
    e=operCod(B(i,:),M(1:n));
    E=[E e];
end
y=E;
end