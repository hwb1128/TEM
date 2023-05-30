clear
clc
im_rgb = imread('项目一着色底图1.jpg');
im_gray = rgb2gray(im_rgb);
[r,c]=size(im_gray);
for i=1:c
    for j=1:r
        if im_gray(j,i) < 200 && im_gray(j,i) > 60
            im_gray(j,i) = 100;
        elseif im_gray(j,i)<20
                im_gray(j,i) = 0;          
        end
    end
end
im_gray2rgb = gray2rgb(im_gray);
figure
imshow(im_gray2rgb);

