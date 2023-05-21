function children = crossover(parents)
% CROSSOVER
% children = CROSSOVER(parents) 交叉操作

[pop_size, number_of_cities] = size(parents);%传入parent的规模    
children = parents;                          %将children初始化为parents

for i = 1:2:pop_size                         %两个一组进行交叉
    parent1 = parents(i+0,:); 
    child1 = parent1;
    parent2 = parents(i+1,:);  
    child2 = parent2;
                                             %随机选择两个进行交叉的基因位并从小到大排序
    insert_points = sort(ceil(number_of_cities*rand(1,2)));
    for j = insert_points(1):insert_points(2)%两个基因位之间的全部基因进行交叉
        if parent1(j)~=parent2(j)            %parent1(j)~=parent2(j)不相等时的交叉操作
            child1(child1==parent2(j)) = child1(j);
            child1(j) = parent2(j);          %两个个体交叉时对冲突的基因位进行调整
            
            child2(child2==parent1(j)) = child2(j);
            child2(j) = parent1(j);
        end
    end
    %交叉完成两个child存入children
    children(i+0,:)=child1;     
    children(i+1,:)=child2;
end

