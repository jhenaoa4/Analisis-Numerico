function y=codStr(str)
%este codigo codifica un string a cadenas de 8 bits
v=[];
c=char(str);
for i=1:length(c)
    v=[v uint8(c(i))];
end
b=[];
for i=1:length(c)
    bi=dec2bin(v(i));
    if str2double(bi)/10 < 1000000
        for j=1:8-length(bi)
            bi=['0' bi];
        end
    end
    b=[b bi];
end
y=b;
end