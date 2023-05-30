warning("off");
clear
close all
clc
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
%%分化处理
AA=SeSeintensity(im_gray_part_max);%%%%%%%%%%%%%%%
%二值化
AAA=twovalue(AA);
[r,c]=size(AAA);
W=[];
WW=[];
a=20;%单元尺寸边长(X0.3nm)
b=20;%单元尺寸边长(X0.3nm)
for n=1:fix(r/a)
    W(n,:)=sum(AAA(a*n+1-a:a*n,:),1);
end
for i=1:fix(c/b)
    WW(:,i)=sum(W(:,b*i+1-b:b*i),2);
end
figure
bar3(WW,0.5);
xlabel('X','FontSize',14,'FontName','Times New Roman','FontWeight','bold');
ylabel('Y','FontSize',14,'FontName','Times New Roman','FontWeight','bold');
zlabel('SeSe site counts','FontSize',14,'FontName','Times New Roman','FontWeight','bold');%%%%%%%%%
set(gca,'XTicklabel',{'0','3','6','9','12','15'});
set(gca,'YTicklabel',{'0','3','6','9','12','15'});
[n,m]=size(WW);
X=[];x1=0;x2=0;x3=0;x4=0;x5=0;x6=0;x7=0;x8=0;x9=0;
for i=1:n
    for j=1:m
        if WW(i,j)==0
            x1=x1+1;
        end
    end
end
for i=1:n
    for j=1:m
        if WW(i,j)==1
            x2=x2+1;
        end
    end
end
for i=1:n
    for j=1:m
        if WW(i,j)==2
            x3=x3+1;
        end
    end
end
for i=1:n
    for j=1:m
        if WW(i,j)==3
            x4=x4+1;
        end
    end
end
for i=1:n
    for j=1:m
        if WW(i,j)==4
            x5=x5+1;
        end
    end
end
 for i=1:n
    for j=1:m
        if WW(i,j)==5
            x6=x6+1;
        end
    end
 end
  for i=1:n
    for j=1:m
        if WW(i,j)==6
            x7=x7+1;
        end
    end
  end
   for i=1:n
    for j=1:m
        if WW(i,j)==7
            x8=x8+1;
        end
    end
   end
    for i=1:n
    for j=1:m
        if WW(i,j)==8
            x9=x9+1;
        end
    end
end
X=[x1,x2,x3,x4,x5,x6,x7,x8,x9];
XX=[1,2,3,4,5,6,7,8,9];
figure
bar(X)
set(gca,'XTicklabel',{'0','1','2','3','4','5','6','7','8','9'});
xlabel('SeSe site counts','FontSize',14,'FontName','Times New Roman','FontWeight','bold');%%%%%%%%%
ylabel('Counts','FontSize',14,'FontName','Times New Roman','FontWeight','bold');
p3=polyfit(XX,X,10);
f3=poly2str(p3,'x');
x11=1:9;
yy3=polyval(p3,x11);
hold on
plot(x11,yy3,'r--');
set(gca,'TickDir','out');
axis square;
%% 删除上刻度线
box off
ax2 = axes('Position',get(gca,'Position'),...
    'Color','none',...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'XColor','k','YColor','k');
set(ax2,'YTick', []);
set(ax2,'XTick', []);
%就是不注释，自己看懂去。。。
%  xlswrite('SeSe',X');