
function h = plot_cities(province, border, city)
%plot_cities
%h = PLOTCITIES(province, border, city) 画出中国地图

global h;
%画出各省份的轮廓
plot(province.long, province.lat, 'color', [0.7, 0.7, 0.7])
hold on         %hold on保存画面不被刷新
%画出国界
plot(border.long, border.lat, 'color', [0.5, 0.5, 0.5], 'LineWidth', 1.5);

h = plot(NaN, NaN,'b-','LineWidth',1);

%画出各省的省会城市(除北京)
plot([city(2:end).long], [city(2:end).lat], 'o', 'markersize', 3, 'MarkerEdgeColor','b','MarkerFaceColor','g');
%画出北京
plot([city(1).long],[city(1).lat],'p','markersize',5, 'MarkerEdgeColor','r','MarkerFaceColor','g');
%显示坐标轴
axis([70 140 15 55]);