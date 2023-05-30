clear
clf
clc
% 显示直方图
I= imread('项目一改.jpg');
figure, subplot(2,2,1), imshow(I), title('原图')
% 划分为256个灰度级
subplot(2,2,2), imhist(I,256), axis tight, title('直方图')
% 归一化
c = imhist(I, 256);
% numel(I)表示该图像的像素数，这里是280x272=76160
c_norm = c / numel(I);
figure, subplot(1,2,1);
% 定制条形图
bar_1 = bar(c);
set(gca, 'XLim', [0 256], 'YLim',[0 max(c)]);%gca是当前轴，设置轴范围
set(bar_1, 'FaceColor', 'r'), title('条形图'); % 设置颜色和标题

% 显示归一化的图
subplot(1,2,2);
bar_2 = bar(c_norm);
xlim([0 32]), ylim([0 max(c_norm)])
title('归一化条形图')
set(bar_2, 'FaceColor', 'g');
