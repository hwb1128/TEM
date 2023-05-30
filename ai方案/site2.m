warning off
close all
clear
clc
img = imread('项目一改.jpg');  % 读取图像

gray_img = rgb2gray(img);

% 选择合适的阈值进行二值化处理
threshold = graythresh(gray_img);
bw_img = imbinarize(gray_img, threshold);

% % 使用形态学运算（开运算和闭运算）去除噪声和平滑图像
% se = strel('disk', 5);
% bw_img = imopen(bw_img, se);
% bw_img = imclose(bw_img, se);

% 对二值化后的图像进行连通区域分析，得到每个连通区域的面积和重心
cc = bwconncomp(bw_img);
stats = regionprops(cc, 'Area', 'Centroid');

% 对每个连通区域的重心所对应的像素点的灰度值进行分析，确定其对应的原子序数
atomic_numbers = zeros(cc.NumObjects, 1);
for i = 1:cc.NumObjects
    x = round(stats(i).Centroid(1));
    y = round(stats(i).Centroid(2));
    gray_value = gray_img(y, x);
    if gray_value > 200
        atomic_numbers(i) = 74;%74
    elseif gray_value > 150
        atomic_numbers(i) = 68;%68
    elseif gray_value > 100
        atomic_numbers(i) = 50;%50
    elseif gray_value > 50
        atomic_numbers(i) = 42;%42
    else
        atomic_numbers(i) = 32;%32
    end
end

% 根据原子序数使用不同的颜色对原子进行标记
colormap = [0 0 1; 0 1 0; 1 0 0; 1 1 0; 1 0 1];
[row, col] = size(gray_img);
rgb_img = zeros(row, col, 3, 'uint8');
for i = 1:cc.NumObjects
    x = round(stats(i).Centroid(1));
    y = round(stats(i).Centroid(2));
    color_index = atomic_numbers(i);%ind2rgb(atomic_numbers, map)
    color = ind2rgb(color_index, colormap);
    rgb_img(y, x, :) = color;
end
figure;
imshow(rgb_img);



