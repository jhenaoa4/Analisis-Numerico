function y=intoBlocks(str,n)
%este codigo recibe una cadena de bits y la devuelve partida en bloques de
%n bits
bl=[];
b=[];
for i=1:length(str)
    b=[b str(i)];
    if mod(i,n)==0
        bl=[bl; b];
        b=[];
    end
end
y=bl;
end