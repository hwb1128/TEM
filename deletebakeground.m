function G = deletebakeground(X)
G = zeros(size(X));
G(X < 80) =0;%100
G(80<= X & X <= 256) =X(80<= X & X <=256);
end