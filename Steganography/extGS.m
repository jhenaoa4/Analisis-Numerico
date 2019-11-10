function [message]=extGS(img,auxX,auxY)

[a,b]=size(auxX);
message=zeros([1 b/7]);
str='';

for i=1:b
    num=img(auxX(i),auxY(i));
    num2=mod(double(num),2);
    nbin=num2str(num2);
    str=strcat(str,nbin);
end
i=1;
while size(str)>0
    str2=extractBetween(str,1,7);
    str=eraseBetween(str,1,7);
    aux=bin2dec(str2);
    message(i)=aux;
    i=i+1;
end
message=char(message);
end
