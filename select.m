function pop_selected = select(pop, fitness, num_selected)
%SELECT
%pop_selected = SELECT(pop, fitness, num_selected)
%num_selectedΪѡ��ĸ�����ѡ����һ������ĸ��壬���þ���ѡ�񷨻�ת�̶�ѡ��

pop_size = size(pop,1);%pop_sizeΪ�������Ⱥ��ģ
                       %��������������ڲμӾ�������Ⱥ,1��num_selected�еľ��󣬴�Ÿ�����±�����
%%
i1 = ceil( pop_size*rand(1,num_selected) );
i2 = ceil( pop_size*rand(1,num_selected) );
%����fitnessֵ���о�����I������������Ⱥ��fitnessֵ�ϸߵĸ���
I = i1.*( fitness(i1)>=fitness(i2) ) + ...
    i2.*( fitness(i1)< fitness(i2) );
%%
%p=fitness/sum(fitness); % ��Ӧֵ��������ܺ�
%cump=cumsum(p);         % ��Ӧֵ���ۻ�����
%I = interp1([0 cump],1:(pop_size+1),rand(1,num_selected),'linear');
%I = floor(I); 
%% 
pop_selected = pop(I,:);
