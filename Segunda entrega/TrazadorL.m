function [] = TrazadorL(xi,y)
n = length(xi);
i = 1;
coef = [];
ind = [];
while i<n 
    m = (y(i+1)-y(i))/(xi(i+1)-xi(i));
    b = y(i)-m*xi(i);
    coef(i) = m;
    ind(i) = b;
    plot(xi,y,'r');
    grid on
    i = i + 1;
end
[m,n]=size(coef);
fprintf('\n Coeficientes trazadores: \n');
for i=1:n
    fprintf('\n %g  %g \n',coef(i),ind(i));
end

%imprimir trazadores
fprintf('\n Trazadores: \n');
for i=1:n
   fprintf('\n (%g)x+(%g) \n',coef(i),ind(i));
end
end