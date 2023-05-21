
function h = plot_cities(province, border, city)
%plot_cities
%h = PLOTCITIES(province, border, city) �����й���ͼ

global h;
%������ʡ�ݵ�����
plot(province.long, province.lat, 'color', [0.7, 0.7, 0.7])
hold on         %hold on���滭�治��ˢ��
%��������
plot(border.long, border.lat, 'color', [0.5, 0.5, 0.5], 'LineWidth', 1.5);

h = plot(NaN, NaN,'b-','LineWidth',1);

%������ʡ��ʡ�����(������)
plot([city(2:end).long], [city(2:end).lat], 'o', 'markersize', 3, 'MarkerEdgeColor','b','MarkerFaceColor','g');
%��������
plot([city(1).long],[city(1).lat],'p','markersize',5, 'MarkerEdgeColor','r','MarkerFaceColor','g');
%��ʾ������
axis([70 140 15 55]);