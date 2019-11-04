function retval = crout (A,b)
%poner 1s en la diagonal
format long
[n,m]= size(A);
Ab=[A,b];
detA=det(A);
L= zeros(n,m);
U=zeros(n,m);

if detA==0;
    return
else
    if n==m
        for k=1:n
            U(k,k)=1;
            suma = 0;
            for p=1:k-1
                suma=suma+L(k,p)*U(p,k);
            end
            L(k,k)=(A(k,k)-suma);
            
            for i=k+1:n;
                suma=0;
                for r=1:k-1
                    suma=suma+L(i,r)*U(r,k);
                end
                L(i,k)=(A(i,k)-suma);
            end
            
            for j=k+1:n
                suma=0;
                for s=1:k-1
                    suma=suma+L(k,s)*U(s,j);
                end
                U(k,j)=(A(k,j)-suma)/L(k,k);
            end
               fprintf('\n Etapa %g = \n',k);
               fprintf('\n L= \n');
               disp(L);
               fprintf('\n U= \n');
               disp(U);
        end
        
        if detA ~= 0
            for i=1:n
                suma=0;
                for p=1:i-1
                    suma=suma+L(i,p)*z(p);
                end
                z(i)=(b(i)-suma)/L(i,i);
            end
            for i=n:-1:1
                suma=0;
                for p=(i+1):n
                    suma = suma+U(i,p)*x(p);
                end
                x(i)=(z(i)-suma)/U(i,i);
            end
        end
    end
end

fprintf('\nLa solucion es:\n');
%Sustitución regresiva
    for i=1:n
		xi=x(1,i);
		fprintf('\n X%g=',i)
		disp(xi);
	end



end