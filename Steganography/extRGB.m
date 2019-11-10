function [message]=extRGB(img,auxX,auxY)
[l,m,n]=size(img);
[a,b]=size(auxX);
message=zeros([1 b]);

for i=1:b
    str='';
    for k=1:3
        num=img(auxX(i),auxY(i),k);
        nbin=dec2bin(num);
        while(size(nbin)<9)
        nbin= strcat('0',nbin);
        end
        str=strcat(str,extractBetween(nbin,7,9));
    end
    aux1=bin2dec(str);
    message(i)=aux1;
    message=char(message);
end
end