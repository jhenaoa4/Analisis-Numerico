function [img]=LSBinRGB(img,message,auxX,auxY)
%%img=imread('stg.jpg');
%%imshow(img)
%img=120+zeros(2,2,3);
%%message='love';
mASCII= dec2bin(double(message));
[l,m,n]= size(img);
[a,b]=size(message);
p=1; %% position of the message you are saving
%for i=1 : size(message)
    for j= 1:b
        for k= 1:n
          bin = dec2bin(img(auxX(j),auxY(j),k));
          while(size(bin)<9)
          bin= strcat('0',bin);
          end
          bin=  eraseBetween(bin,7,9);
          char= mASCII(p);
          while(size(char)<9)
          char= strcat('0',char);
          end
          splitChar=[extractBetween(char,1,3) extractBetween(char,4,6) extractBetween(char,7,9)];
          bin= strcat(bin,splitChar(k));
          img(auxX(j),auxY(j),k)=bin2dec(bin);
          p=p+1;
        end
    end
    %%img
imshow(img)
end
