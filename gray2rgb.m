%% 灰度图转换为彩色图
function I = gray2rgb(X)
R = redTransformer(X);
G = greenTransformer(X);
B = blueTransformer(X);
I(:,:,1) = R;
I(:,:,2) = G;
I(:,:,3) = B;
I = uint8(I);
end