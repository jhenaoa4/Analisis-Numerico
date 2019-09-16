function y = pivoteoTotal(Ab,n,k)
mayor=0;
filMayor=k;
colMayor=k;
% marcas = 1:n;
for r=k:n
    for s=k:n
        if abs(Ab(r,s)) > mayor
            mayor=abs(Ab(r,s));
            filMayor=r;
            colMayor=s;
        end
    end
end
if mayor == 0
    y="El sistema no tiene solución";
else
    if filMayor~=k
        Ab([filMayor k],:);
    end
    if colMayor ~= k
        Ab([colMayor k],:);
%         marcas=marcas([colMayor k],:);
    end
    y=Ab;
%     disp(marcas);
end
end