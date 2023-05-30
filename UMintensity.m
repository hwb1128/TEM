function W=UMintensity(X,a)
[r,c]=size(X);
W=X;
%去钨位点
for i=1:r
    for j=1:c
        if X(i,j)<=230%246、230
            W(i,j)=X(i,j);
        else 
            W(i,j)=0;
        end
    end
end
for k=1:20
for i=k:a:r
    for j=k:a:c
        if X(i,j)<80%100
            W(i,j)=0;
        elseif X(i,j)<=90%100
            W(i,j)=0;
        elseif X(i,j)<=120
            W(i,j)=X(i,j);
        elseif X(i,j)<=160
            W(i,j)=0;
        elseif X(i,j)<=180
            W(i,j)=X(i,j);
        elseif X(i,j)<=230
            W(i,j)=X(i,j);
        else 
            W(i,j)=0;
        end
    end
end
end
end