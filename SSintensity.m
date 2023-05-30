function W=SSintensity(X)
[r,c]=size(X);
W=zeros(r,c);
for i=1:c
    for j=1:r
        if X(j,i)<=100%100
            W(j,i)=0;
        elseif X(j,i)<=105%120
                W(j,i)=X(j,i);
        else 
            W(j,i)=0;
        end
    end
end
end

            
