function W=SeSeintensitycolar(X)
[r,c]=size(X);
W=zeros(r,c);
for i=1:c
    for j=1:r
        if X(j,i)<=155
            W(j,i)=0;
        else
            W(j,i)=X(j,i);
        end
    end
end
end