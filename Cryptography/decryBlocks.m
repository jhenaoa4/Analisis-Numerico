function y=decryBlocks(B,k,n)
E=[];
[row col]=size(B);
for i=1:row
    e=invPermCod(B(i,:),k,n);
    if i>1
        d=invOperCod(B(i-1,:),e);
    else d=e; 
    end
    E=[E d];
end
y=E;
end