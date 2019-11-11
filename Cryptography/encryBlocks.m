function y=encryBlocks(B,k,n)
E=[];
[row col]=size(B);
for i=1:row
    if i>1
    cl=operCod(o,B(i,:));
    else cl=B(i,:);
    end
    e=permCod(cl,k,n);
    E=[E e];
    o=e;
end
y=E;
end