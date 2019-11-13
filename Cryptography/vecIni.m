function y=vecIni(r)
I=[];
for i=1:r
    g=rand;
    if g>0.5
    I=[I '1'];
    else I=[I '0'];
    end
end
y=I;
end