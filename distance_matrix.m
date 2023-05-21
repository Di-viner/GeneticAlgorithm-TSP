function distance = distance_matrix(city)
%distance_matrix
%distance = DISTANCEMATRIX(city)
%return the distance matrix:distance(i,j),由城市的经纬度算出两个城市之间的
%距离，并用邻接矩阵表示，i j城市的距离存在distance（i，j）中

number_of_cities = length(city);    %city的个数，此处为34
R = 6378.137;                       %R为地球半径

for i =1:number_of_cities           %distance_of_2cities函数计算两个城市间的距离
    for j= i + 1: number_of_cities
        distance(i,j) = distance_of_2cities(city(i).lat,city(i).long,...
                                            city(j).lat,city(j).long,R);
        distance(j,i) = distance(i,j);
    end
end
     
%由经纬度计算出距离       
function d = distance_of_2cities(lat1, long1, lat2, long2, R)
% DISTANCE
% d = DISTANCE(lat1, long1, lat2, long2, R) 由经纬度计算出距离
y1= lat1/180*pi;
x1= long1/180*pi;
y2= lat2/180*pi;
x2= long2/180*pi;
dy= y1-y2;
dx= x1-x2;
d = 2*R*asin(sqrt(sin(dy/2)^2+sin(dx/2)^2*cos(y1)*cos(y2)));
