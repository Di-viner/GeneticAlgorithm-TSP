function pop_selected = select(pop, fitness, num_selected)
%SELECT
%pop_selected = SELECT(pop, fitness, num_selected)
%num_selected为选择的个数，选择下一代生存的个体，采用竞争选择法或转盘赌选择法

pop_size = size(pop,1);%pop_size为传入的种群规模
                       %随机生成两个用于参加竞争的种群,1行num_selected列的矩阵，存放个体的下标索引
%%
i1 = ceil( pop_size*rand(1,num_selected) );
i2 = ceil( pop_size*rand(1,num_selected) );
%根据fitness值进行竞争，I保存了两个种群中fitness值较高的个体
I = i1.*( fitness(i1)>=fitness(i2) ) + ...
    i2.*( fitness(i1)< fitness(i2) );
%%
%p=fitness/sum(fitness); % 适应值函数相加总和
%cump=cumsum(p);         % 适应值的累积函数
%I = interp1([0 cump],1:(pop_size+1),rand(1,num_selected),'linear');
%I = floor(I); 
%% 
pop_selected = pop(I,:);
