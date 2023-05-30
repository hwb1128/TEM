warning('off')
close all
clear
clc
%% 降噪去黑背景
im_rgb = imread('项目一改.jpg');
im_gray = rgb2gray(im_rgb);
im_gray1=deletebakeground(im_gray);
im_twomax0=imregionalmax(im_gray1);
im_twomax1=imregionalmax(im_twomax0);

%% 标记原矩阵
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
A=im_gray_part_max;
%% 统计矩阵
B1=SSintensity(A);
B2=Mointensity(A);
B3=SSeintensity(A);
B4=SeSeintensity(A);
B5=Wintensity(A);
%% 转化为二值矩阵
C1=twovalue(B1);
C2=twovalue(B2);
C3=twovalue(B3);
C4=twovalue(B4);
C5=twovalue(B5);
%% 统计
S1=sum(C1(:));%SS
S2=sum(C2(:));%MO
S3=sum(C3(:));%SSe
S4=sum(C4(:));%SeSe
S5=sum(C5(:));%W
%% 归一化
S=2*S1+2*S2+2*S3+2*S4+S5;
yita=[];
yita(1)=(S1*2+S3)/S;%S
yita(2)=(2*S2)/S;%Mo
yita(3)=(2*S4+S3)/S;%Se
yita(4)=S5/S;%W
pie(yita);
legend('S','Mo','Se','W');