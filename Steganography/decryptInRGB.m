function [decM] = decryptInRGB(key,n,image,auxX,auxY)
mes = extRGB(image,auxX,auxY);
decM = decrypt(mes,key,n)
end