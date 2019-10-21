function matrizEstDom(M, n)
domF=true;
for i=1:n
    norma=0;
    for j=1:n
        if j~=i
            norma=norma+abs(M(i,j));
        end
    end
    if abs(M(i,i))<= sqrt(norma)
        domF=false;
        break;
    end
end
domC=true;
for i=1:n
    norma=0;
    for j=1:n
        if j~=i
            norma=norma+(M(j,i).^2);
        end
    end
    if abs(M(i,i))<=sqrt(norma)
        domC=false;
        break;
    end
end
if domC && domF
    disp("La matriz ingresada es estrictamente dominante diagonalmete")
else
    disp("La matriz ingresada no es estrictamente dominante diagonalmete")
end