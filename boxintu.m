warning('off')
close all
clear
clc
%%降噪去黑背景
im_rgb = imread('项目一改.jpg');
im_gray = rgb2gray(im_rgb);
im_gray1=deletebakeground(im_gray);
im_twomax0=imregionalmax(im_gray1);
im_twomax1=imregionalmax(im_twomax0);
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
X=[];
%%灰度矩阵的最值（原子位点）统计
for k=1:256
    X(1,k)=sum(im_gray_part_max(:)==k);
end
figure
bar(X);%位点分布图

%%金属统计
W=Wintensity(im_gray_part_max);
for k=1:256
    W1(1,k)=sum(W(:)==k);
end
Mo=Mointensity(im_gray_part_max);
for k=1:256
    Mo1(1,k)=sum(Mo(:)==k);
end
figure
bar(W1,'red');
hold on
bar(Mo1,'yellow');
%%非金属统计
SS=SSintensity(im_gray_part_max);
for k=1:256
    SS1(1,k)=sum(SS(:)==k);
end
SSe=SSeintensity(im_gray_part_max);
for k=1:256
    SSe1(1,k)=sum(SSe(:)==k);
end
SeSe=SeSeintensity(im_gray_part_max);
for k=1:256
    SeSe1(1,k)=sum(SeSe(:)==k);
end
figure
bar(SSe1,'cyan');
hold on
bar(SS1,'green');
hold on
bar(SeSe1,'blue');
