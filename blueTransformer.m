%% 蓝色通道映射函数
function B = blueTransformer(X)
B = zeros(size(X));
B(X < 90) = 0;
B(100 <= X & X < 129) =0;
B(129 <= X & X < 161) =240;
B(161 <= X & X < 186) =0;
B(186<= X & X < 200) =255;
B(X >=200) = 0;
end
