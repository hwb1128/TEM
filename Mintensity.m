function W=Mintensity(X,a)
[r,c]=size(X);
W=X;
for k=1:20
for i=k:a:r
    for j=k:a:c
        if X(i,j)<129
            W(i,j)=0;
        elseif X(i,j)<=160
            W(i,j)=X(i,j);
        elseif X(i,j)<=230
            W(i,j)=0;
        else
            W(i,j)=X(i,j);
        end
    end
end
end
end
