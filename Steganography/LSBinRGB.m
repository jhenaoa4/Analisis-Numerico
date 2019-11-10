function [img]=LSBinRGB(img,message,auxX,auxY)
img=imread(img);
%%imshow(img)
%img=120+zeros(2,2,3);
%%message='love';
%mASCII= double(message)
[l,m,n]= size(img);
[a,b]=size(message);
    for j= 1:b
        char= dec2bin(double(message(j)));
        while(size(char)<9)
        char= strcat('0',char);
        end
        splitChar = [extractBetween(char,1,3) extractBetween(char,4,6) extractBetween(char,7,9)];
        for k= 1:n
            %img(auxX(j),auxY(j),k)
          bin = dec2bin(img(auxX(j),auxY(j),k));
          while(size(bin)<9)
          bin= strcat('0',bin);
          end
          bin=  eraseBetween(bin,7,9);
          bin= strcat(bin,splitChar(k));
          img(auxX(j),auxY(j),k)=bin2dec(bin);
        end
    end

imshow(img)
end