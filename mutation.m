function children = mutation(parents, pro_mutation)
% MUTATION
% children = MUTATION(parents, pro_mutation) 
% parents每个个体以pro_mutation概率突变


%1.互换2.倒序基因位之间的一段基因3.将第一个基因放到第二个基因后
[pop_size, number_of_cities] = size(parents);
children = parents;   %将children初始化位parents
for k=1:pop_size
    if rand < pro_mutation
       insert_points = ceil(number_of_cities*rand(1,2));
       I = min(insert_points);  J = max(insert_points);
       switch ceil(rand*6)
           case 1    % 互换
             children(k,[I J]) = parents(k,[J I]);
           case 2    % 将第一个基因放到第二个基因后一个位置
             children(k,[I:J]) = parents(k,[I+1:J I]);
           otherwise % 倒序基因位之间的一段基因
             children(k,[I:J]) = parents(k,[J:-1:I]);
       end
    end
end

