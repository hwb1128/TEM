function A = twovalue(X)
[r,c]=size(X);
A=zeros(r,c);
for i=1:c
    for j=1:r
        if X(j,i)==0
            A(j,i)=0;
        else 
            A(j,i)=1;
        end
    end
end
end
