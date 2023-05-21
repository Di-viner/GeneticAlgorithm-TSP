function pop_dist = total_distance(pop,distance)
%total_distance
%pop_dist = TOTALDISTANCE(pop,distance)
%由pop种群个体矩阵和distance距离矩阵计算出每个个体的总路程

[population_size, number_of_cities]= size(pop);
for i = 1:population_size
    d=distance(pop(i,end),pop(i,1));%最后一个城市到第一个城市形成闭环
    for k = 2:number_of_cities      %第一个城市到第n个城市的总距离
        d = d + distance(pop(i,k-1),pop(i,k));
    end
    pop_dist(i) = d;                %结果存放到pop_dist
end

