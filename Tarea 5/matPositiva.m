function matPositiva(M)
v=poly(M);
r=roots(v);
pos=true;
for i=1:length(r)
   if r(i)<=0
       disp("La matriz ingresada no es definida positiva")
       pos=false;
       break;
   end
end
if pos
    disp("La matriz ingresada es definida positiva")
end