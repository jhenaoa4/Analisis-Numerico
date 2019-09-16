function y=EGPivoteoTotal(A,b,n)
Ab= [A,b];
for k=1: (n)
    Ab = pivoteoTotal(Ab,n,k);
    for i=k+1: n
       mult= Ab(i,k)/ Ab(k,k) ;
       for j= k :n+1
           Ab(i,j)= Ab(i,j)- (mult*Ab(k,j));
       end
    end
end
y= Ab;
end