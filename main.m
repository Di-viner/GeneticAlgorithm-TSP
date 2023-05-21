%%
clear;clc;
%加载中国地图
load china;
%画出中国地图
plot_cities(province, border, city);
%%
%各参数设置初始化
number_of_cities = length(city);    %number_of_cities为城市个数
distance = distance_matrix(city);   %distance为存放各城市距离的矩阵
population_size = 100;              %种群密度(有多少个个体)
max_generation = 500;              %迭代次数(循环次数)
pro_mutation = 0.16;                %变异概率
%%
%初始化种群
rng(0);                                  %用种子 0 初始化梅森旋转生成器
pop = zeros(population_size,number_of_cities);   %pop为population_size行number_of_cities的矩阵
for i=1:population_size
    pop(i,:)=randperm(number_of_cities);         %循环population_size次初始化pop
end
distance_min=zeros(1,max_generation);            %distance_min存放每一代最短的距离
%%
%迭代过程
for generation = 1:max_generation
    pop_dist = total_distance(pop,distance);%pop_dist为每个个体的总路程
    fitness = 1./pop_dist;                  %适应值函数设置为路程的倒数
    
    %每一代寻找最优路径和最短路程值
    [min_dist, bestID] = min(pop_dist);     %min_dist为最短路程值，bestID为索引
    best_pop = pop(bestID,:);               %由bestID从pop中找到最优路径，并由best_pop存放
    distance_min(generation)=min_dist;      %每一代的min_dist最短路程值放入distance_min中
    %相隔10代从屏幕中重画路径，动态表示效果

    if mod(generation,10)==0
        plot_route(city, best_pop, min_dist,generation);
    end
    
    %选择操作
    pop = select(pop, fitness, population_size);
    %交叉操作
    pop = crossover(pop);
    %变异操作
    pop = mutation(pop, pro_mutation);
    % 保存本代的最优解
    pop = [best_pop; pop];
end
%%
%找到最终的最优路径并在屏幕上画出
[min_dist, bestID]=min(pop_dist); 
best_pop = pop(bestID, :);
plot_route(city, best_pop, min_dist, generation);
%在第二个窗口画出最短路径与迭代次数的关系
figure(2);
plot(distance_min);
 