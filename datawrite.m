warning('off')
close all
clear
clc
%%降噪去黑背景
im_rgb = imread('项目一改.jpg');
im_gray = rgb2gray(im_rgb);
fid=fopen('原始数据.txt','wt');%写入文件路径
[m,n]=size(im_gray);
for i=1:1:m
for j=1:1:n
if j==n
fprintf(fid,'%g\n',im_gray(i,j));
else
fprintf(fid,'%g\t',im_gray(i,j));
end
end
end
fclose(fid);