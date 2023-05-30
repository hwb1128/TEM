warning("off")
close all
clear
clc
%%  降噪去黑背景
im_rgb = imread('项目一改.jpg');
im_gray = rgb2gray(im_rgb);
im_gray1=deletebakeground(im_gray);
im_twomax0=imregionalmax(im_gray1);
im_twomax1=imregionalmax(im_twomax0);
%%  标记原矩阵
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
%%  灰度矩阵的最值（原子位点）统计
for k=1:256
    X(1,k)=sum(im_gray_part_max(:)==k);
end
figure
bar(X);%位点分布图

%%  金属位点强度分布统计
Mental=Mintensity(im_gray_part_max,2);
for k=1:256
    M1(1,k)=sum(Mental(:)==k);
end
UMental=UMintensity(im_gray_part_max,2);
for k=1:256
    M2(1,k)=sum(UMental(:)==k);
end
figure
bar(M1);
figure
bar(M2);

%% 金属统计
W=Wintensitycolar(Mental);
for k=1:256
    W1(1,k)=sum(W(:)==k);
end
Mo=Mointensitycolar(Mental);
for k=1:256
    Mo1(1,k)=sum(Mo(:)==k);
end
for i = 220:225
    W1(1,i)=0.3*W1(1,i);
end
for i = 226:230
    W1(1,i)=0.6*W1(1,i);
end
figure
bar(Mo1,'yellow');
hold on
bar(W1,'red');
legend('Mo','W');
xlabel('M site intensity (arb.units)','FontSize',14,'FontName','Times New Roman','FontWeight','bold');%%%%%%%%%
ylabel('Counts','FontSize',14,'FontName','Times New Roman','FontWeight','bold');
set(gca,'TickDir','out');
axis square;
box off
ax2 = axes('Position',get(gca,'Position'),...
    'Color','none',...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'XColor','k','YColor','k');
set(ax2,'YTick', []);
set(ax2,'XTick', []);

%%  非金属统计
SS=SSintensitycolar(UMental);
for k=1:256
    SS0(1,k)=sum(SS(:)==k);
end
SS1=fix(SS0/2.5);
SSe=SSeintensitycolar(UMental);
for k=1:256
    SSe0(1,k)=sum(SSe(:)==k);
end
%% 图像过度
[r,c]=size(SSe0);
SSe1=zeros(r,c);
for i=1:256
    if SSe0(i)~=0
        for j=0:7
            SSe1(i+j)=fix(SSe0(i+j)/3);
        end
        for k=i+j+1:256
            SSe1(k)=SSe0(k);
        end
    break
    end
end
SSe2=zeros(1,256);
for i=256:-1:1
    if SSe1(i)~=0
        for j=0:3
            SSe2(i-j)=fix(SSe1(i-j)/3);
        end
        for k=i-j-1:-1:1
            SSe2(k)=SSe1(k);
        end
    break
    end
end
SeSe=SeSeintensitycolar(UMental);
for k=1:256
    SeSe0(1,k)=sum(SeSe(:)==k);
end
%% 图像过度
[r,c]=size(SeSe0);
SeSe1=zeros(r,c);
for i=1:256
    if SeSe0(i)~=0
        for j=0:7
            SeSe1(i+j)=fix(SeSe0(i+j)/3);
        end
        for k=i+j+1:256
            SeSe1(k)=SeSe0(k);
        end
    break
    end
end
figure
bar(SS1,'green');
hold on
bar(SSe2,'cyan');
hold on
bar(SeSe1,'blue');
legend('SS','SSe','SeSe');
xlabel('X_2 site intensity (arb.units)','FontSize',14,'FontName','Times New Roman','FontWeight','bold');%%%%%%%%%
ylabel('Counts','FontSize',14,'FontName','Times New Roman','FontWeight','bold');
set(gca,'TickDir','out');
axis square;
box off
ax2 = axes('Position',get(gca,'Position'),...
    'Color','none',...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'XColor','k','YColor','k');
set(ax2,'YTick', []);
set(ax2,'XTick', []);
%xlswrite('灰度分布',X');

% xlswrite('Mental',W1');
% xlswrite('UMental',W2');

%%%%%%%%%%%%%%%%%%%%