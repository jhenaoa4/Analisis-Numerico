function retval = gauss (vecini,nmax,tol,A,b)
%%Gauss Seidel nu
%%checked 
format long
D=diag(diag(A));
L=-1* tril(A,-1);
U=-1*triu(A,1);
T=inv(D-L)*(U)
C=inv(D-L)*b

radio=max(eig(T))
i=0;
error=tol+1;
while i<nmax && error>tol
  i=i+1
  X=T*vecini+C
  error=norm(X-vecini)
  disp('------------------------------------------------')
  
  vecini=X;
end



end