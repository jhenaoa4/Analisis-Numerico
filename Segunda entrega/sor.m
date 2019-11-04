function retval = sor (vecini,nmax,tol,w,A,b)
%%Checked
format long
D=diag(diag(A));
L= -1*tril(A,-1);
U=-1*triu(A,1);
T=inv(D-w*L)*((1-w)*D+(w*U))
C=w*inv(D-w*L)*b
radio=max(abs(eig(T)))

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
