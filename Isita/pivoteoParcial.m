function y=pivoteoParcial(Ab , n , k)
numMayor = abs(Ab(k,k));
filMayor = k;
for s=k+1:n
   if  abs(Ab(s,k)) > numMayor
       numMayor = abs(Ab(s,k));
       filMayor = s;
   end
end
if numMayor == 0 
    disp("EL SISTEMA NO TIENE SOLUCIÓN ÚNICA");
else
    if filMayor ~= k 
        Ab=InterFil(Ab , filMayor , k);
    end
    y=Ab;
end

end

function g=InterFil(A,f1 , f2)
aux=A;
aux(f1,:)=A(f2,:);
aux(f2,:)=A(f1,:);
g=aux;
end