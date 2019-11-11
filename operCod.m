function y=operCod(c1,c2)
%este codigo opera dos bloques+
cf=[];
for i=1:length(c1)
    n1=(c1(i));
    n2=(c2(i));
    if n1==n2
        cf=[cf '0'];
    else cf=[cf '1'];
    end
end
y=cf;
end