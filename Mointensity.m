function W=Mointensity(X)
[r,c]=size(X);
W=zeros(r,c);
for i=1:c
    for j=1:r
        if X(j,i)<=135%129
            W(j,i)=0;
        elseif X(j,i)<=155%160
                W(j,i)=X(j,i);
        else 
            W(j,i)=0;
        end
    end
end
end