function createfigure(ymatrix1)
%CREATEFIGURE(ymatrix1)
%  YMATRIX1:  bar 矩阵数据

%  由 MATLAB 于 23-Nov-2022 18:58:52 自动生成

% 创建 figure
figure('OuterPosition',[273.8 270.6 574.4 508.8]);

% 创建 axes
axes1 = axes;
hold(axes1,'on');

% 使用 bar 的矩阵输入创建多行
bar1 = bar(ymatrix1,'EdgeColor','none','BarWidth',2);
set(bar1(3),'DisplayName','SS','FaceColor',[0 1 0]);
set(bar1(2),'DisplayName','SSe','FaceColor',[0 1 1]);
set(bar1(1),'DisplayName','SeSe','FaceColor',[0 0 1]);

% 创建 ylabel
ylabel('Counts','FontWeight','bold','FontSize',20,...
    'FontName','Times New Roman');

% 创建 xlabel
xlabel('X_2 site intensity (arb.units)','FontWeight','bold','FontSize',20,...
    'FontName','Times New Roman');

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[51 256]);
axis(axes1,'square');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'FontSize',13,'FontWeight','bold','LineWidth',1,'TickDir','out',...
    'XTick',[0 92 133 174 215 255],'XTickLabel',...
    {'0','0.2','0.4','0.6','0.8','1.0'});
% 创建 legend
legend(axes1,'show');

% 创建 axes
axes2 = axes('Position',...
    [0.231428571428571 0.175238095238095 0.568571428571428 0.749761904761907]);

% 设置其余坐标区属性
set(axes2,'Color','none','LineWidth',1,'XAxisLocation','top','XColor',...
    [0 0 0],'XTick',[],'YAxisLocation','right','YColor',[0 0 0],'YTick',[]);
