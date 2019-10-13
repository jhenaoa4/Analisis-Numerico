function y = determinante(mat)
if length(mat) == 2
    y = mat(1,1)*mat(2,2) - mat(1,2)*mat(2,1);
else
    for j=1:length(mat)
        aux = mat;
        aux(1,:) = [];
        aux(:,j) = [];
        if j==1
            y =((-1)^(1+j))*mat(1,j)*determinante(aux);
        else
            y = y+((-1)^(1+j))*mat(1,j)*determinante(aux);
        end
    end
end
end