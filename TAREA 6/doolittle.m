function retval = crout (A,b)
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
            L(k,k)=1;
            suma = 0;
            for p=1:k-1
                suma=suma+L(k,p)*U(p,k);
            end
            U(k,k)=(A(k,k)-suma);
            
            for i=k+1:n;
                suma=0;
                for r=1:k-1
                    suma=suma+L(i,r)*U(r,k);
                end
                L(i,k)=(A(i,k)-suma)/U(k,k);
            end
            
            for j=k+1:n
                suma=0;
                for s=1:k-1
                    suma=suma+L(k,s)*U(s,j);
                end
                U(k,j)=(A(k,j)-suma);
            end
        end
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
%end

disp(Ab)
disp(L)
disp(U)
                
%Sustitución regresiva
    for i=1:n
		xi=x(1,i);
		fprintf('\n X%g=',i)
		disp(xi);
    end


end