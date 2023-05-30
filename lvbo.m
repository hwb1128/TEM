warning('off')
close all
clear
clc
%%降噪去黑背景
im_rgb = imread('example_tem_image.png');
im_gray = rgb2gray(im_rgb);
im_gray1=deletebakeground(im_gray);
im_twomax0=imregionalmax(im_gray1);
im_twomax1=imregionalmax(im_twomax0);
figure
subplot(2,2,1),imshow(im_gray);
subplot(2,2,2),imshow(im_gray1);
subplot(2,2,3),imshow(im_twomax0);
subplot(2,2,4),imshow(im_twomax1);
%%标记原矩阵
[r,c]=size(im_gray);
S=zeros(r,c);
for i=1:c
    for j=1:r
        if im_twomax1(j,i)==0
            S(j,i)=0;
        elseif im_twomax1(j,i)==1
            S(j,i)=im_gray(j,i);
        end
    end
end
im_gray_part_max=S;
figure
subplot(1,2,1),imshow(im_gray_part_max);
X=[];
%%灰度矩阵的最值（原子位点）统计
for k=1:256
    X(1,k)=sum(im_gray_part_max(:)==k);
end
figure
bar(X);%位点分布图
% %%%%%%%%%%%%%%%%%
% for j=3:c
%     for i=3:r
%         if im_twomax1(i,j)>0
%             im_gray_part_max(i-1,j-1)=im_gray_part_max(i,j);
%             im_gray_part_max(i-1,j)=im_gray_part_max(i,j);
%             im_gray_part_max(i-1,j+1)=im_gray_part_max(i,j);
%             im_gray_part_max(i,j-1)=im_gray_part_max(i,j);
%             im_gray_part_max(i,j)=im_gray_part_max(i,j);
%             im_gray_part_max(i,j+1)=im_gray_part_max(i,j);
%             im_gray_part_max(i+1,j-1)=im_gray_part_max(i,j);
%             im_gray_part_max(i+1,j)=im_gray_part_max(i,j);
%             im_gray_part_max(i+1,j+1)=im_gray_part_max(i,j);
%         end
%     end
% end
%%%%%%%%%%%%%%
%像素点扩大
for j=3:c
    for i=3:r
        if im_twomax1(i,j)>0
            im_gray_part_max(i-2,j-1)=im_gray_part_max(i,j);
            im_gray_part_max(i-2,j)=im_gray_part_max(i,j);
            im_gray_part_max(i-2,j+1)=im_gray_part_max(i,j);
            im_gray_part_max(i-1,j-2)=im_gray_part_max(i,j);
            im_gray_part_max(i-1,j-1)=im_gray_part_max(i,j);
            im_gray_part_max(i-1,j)=im_gray_part_max(i,j);
            im_gray_part_max(i-1,j+1)=im_gray_part_max(i,j);
            im_gray_part_max(i-1,j+2)=im_gray_part_max(i,j);
            im_gray_part_max(i,j-2)=im_gray_part_max(i,j);
            im_gray_part_max(i,j-1)=im_gray_part_max(i,j);
            im_gray_part_max(i,j)=im_gray_part_max(i,j);
            im_gray_part_max(i,j+1)=im_gray_part_max(i,j);
            im_gray_part_max(i,j+2)=im_gray_part_max(i,j);
            im_gray_part_max(i+1,j-2)=im_gray_part_max(i,j);
            im_gray_part_max(i+1,j-1)=im_gray_part_max(i,j);
            im_gray_part_max(i+1,j)=im_gray_part_max(i,j);
            im_gray_part_max(i+1,j+1)=im_gray_part_max(i,j);
            im_gray_part_max(i+1,j+2)=im_gray_part_max(i,j);
            im_gray_part_max(i+2,j-1)=im_gray_part_max(i,j);
            im_gray_part_max(i+2,j)=im_gray_part_max(i,j);
            im_gray_part_max(i+2,j+1)=im_gray_part_max(i,j);
        end
    end
end
im_gray2rgb = gray2rgb(im_gray_part_max);
figure
subplot(1,2,1),imshow(im_gray_part_max)
subplot(1,2,2), imshow(im_gray2rgb)
figure
imshow(im_gray_part_max)

