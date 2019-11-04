function retval =  cholesky(A,b)
%format long

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
                sum1=0;
                for p=1:k-1
                    sum1=sum1+L(k,p)*U(p,k);
                end
               L(k,k)=sqrt(A(k,k)-sum1);
               U(k,k)=L(k,k);
               for i=k+1:n
                   sum2=0;
                   for q=1:k-1
                       sum2=sum2+L(i,q)*U(q,k);
                   end
                   L(i,k)=(A(i,k)-sum2)/L(k,k);
               end
               for j=k+1:n
                   sum3=0;
                   for r=1:k-1
                       sum3=sum3+L(k,r)*U(r,j);
                   end
                   U(k,j)=(A(k,j)-sum3)/L(k,k);
               end
               fprintf('\n Etapa %g = \n',k);
               fprintf('\n L= \n');
               disp(L);
               fprintf('\n U= \n');
               disp(U);
            end
            
            if detA~=0
                for i=1:n
                    suma=0;
                    for p=1:i-1
                        suma=suma+L(i,p)*y(p);
                    end
                    y(i)=(b(i)-suma)/L(i,i);
                end
                for i=n:-1:1
                    suma=0;
                    for p=i+1:n
                        suma = suma+U(i,p)*x(p);
                    end
                    x(i)=(y(i)-suma)/U(i,i);
                end
            end
        end
end
%%disp(Ab)

fprintf('\nLa solucion es:\n');
 for i=1:n
		xi=x(1,i);
		fprintf('\n X%g=',i)
		disp(xi);
    end
            

end