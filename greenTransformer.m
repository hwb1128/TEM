%% 绿色通道映射函数
function G = greenTransformer(X)
G = zeros(size(X));
G(X < 90) = 0;
G(100 <= X & X < 129) =255;
G(129 <= X & X < 161) =32;
G(161 <= X & X < 186) =255;
G(186<= X & X < 200) =255;
G(X >=200) = 0;
end
