function y=complet(str,n)
%este codigo completa la cadena de it para que se puedan hacer bloques de
%bist de longitud n
if mod(length(str),n) ~= 0
    for i=1:(n-mod(length(str),n))
        str=[str '0'];
    end
end
y=str;
end