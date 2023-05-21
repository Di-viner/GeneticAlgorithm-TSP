function distance = distance_matrix(city)
%distance_matrix
%distance = DISTANCEMATRIX(city)
%return the distance matrix:distance(i,j),�ɳ��еľ�γ�������������֮���
%���룬�����ڽӾ����ʾ��i j���еľ������distance��i��j����

number_of_cities = length(city);    %city�ĸ������˴�Ϊ34
R = 6378.137;                       %RΪ����뾶

for i =1:number_of_cities           %distance_of_2cities���������������м�ľ���
    for j= i + 1: number_of_cities
        distance(i,j) = distance_of_2cities(city(i).lat,city(i).long,...
                                            city(j).lat,city(j).long,R);
        distance(j,i) = distance(i,j);
    end
end
     
%�ɾ�γ�ȼ��������       
function d = distance_of_2cities(lat1, long1, lat2, long2, R)
% DISTANCE
% d = DISTANCE(lat1, long1, lat2, long2, R) �ɾ�γ�ȼ��������
y1= lat1/180*pi;
x1= long1/180*pi;
y2= lat2/180*pi;
x2= long2/180*pi;
dy= y1-y2;
dx= x1-x2;
d = 2*R*asin(sqrt(sin(dy/2)^2+sin(dx/2)^2*cos(y1)*cos(y2)));
