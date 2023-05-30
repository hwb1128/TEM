%% 红色通道映射函数
function R = redTransformer(X)
R = zeros(size(X));
R(X < 90) = 0;
R(100 <= X & X < 129) =255;%S+S黄色
R(129 <= X & X < 161) =160;%Mo紫色
R(161 <= X & X < 186) =0;%S+Se绿色
R(186<= X & X < 200) =0;%Se+Se青色(上限原为246)
R(200 <= X) =255;%W红色
end
