function[C]= decod(Ar)
n=length(Ar);
letras=zeros(n,1);
letras=char(letras);
for i=1:n
    letras(i,1)=char(Ar(i));
end
C=letras;
end
