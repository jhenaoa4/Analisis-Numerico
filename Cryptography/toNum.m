  
function y=toNum(str)
s=[];
p=[];
for i=1:length(str)
    s=[s str(i)];
    if mod(i,8)==0
        p=[p;s];
        s=[];
    end
    y=p;
end