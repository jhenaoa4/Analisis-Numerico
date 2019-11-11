function y=invKey(k)
m=[];
for i=1:length(k)
    for j=1:length(k)
        if i==k(j);
            m=[m j];
        end
    end
end
y=m;
end