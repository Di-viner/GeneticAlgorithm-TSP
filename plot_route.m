function plot_route(city, route, distance,generation)
%PLOTROUTE
%PLOTROUTE(city,route,distance,generation)
%����Ļ�ϻ���·��
global h;
cycle = route([1:end,1]);
%����·��
set(h,'Xdata',[city(cycle).long],'Ydata',[city(cycle).lat]);
xlabel(sprintf('generation = %5i        Total Distance = %6.1f',...
                   generation,             distance));
drawnow
               
      


