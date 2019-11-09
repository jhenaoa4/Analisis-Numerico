function [message]=extRGB(img,auxX,auxY)
[l,m,n]=size(img);
[a,b]=size(auxX);
message='';

for i=1:b
    str='';
    for k=1:3
        str=strcat(str,extractBetween(img(auxX(i),auxY(i),k),7,9));
    end
    aux1=bin2dec(str);
    aux2=char(aux1);
    message=strcat(message,aux2);
end
end