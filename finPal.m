function y=finPal(str)
%este codigo recibe una cadena de bits y retoran la palabra correspondiente
pal="";
[r c]=size(str);
for i=1:r
    p=bin2dec(str(i,:));
    d=decod(p);
    pal=pal+d;
end
y=pal;
end