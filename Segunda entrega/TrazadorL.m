function y = TrazadorL(xi,y)
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
coef
ind
end