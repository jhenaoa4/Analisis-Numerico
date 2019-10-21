function matPositiva(M)
p=true;
for i=1:length(M)
    if det(M(1:i,1:i)) <= 0
        p=false;
    end
end
if p
    disp("La matriz ingresada es definida positiva")
else
    disp("La matriz ingresada no es definida positiva")
end
end