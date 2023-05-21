function pop_dist = total_distance(pop,distance)
%total_distance
%pop_dist = TOTALDISTANCE(pop,distance)
%��pop��Ⱥ��������distance�����������ÿ���������·��

[population_size, number_of_cities]= size(pop);
for i = 1:population_size
    d=distance(pop(i,end),pop(i,1));%���һ�����е���һ�������γɱջ�
    for k = 2:number_of_cities      %��һ�����е���n�����е��ܾ���
        d = d + distance(pop(i,k-1),pop(i,k));
    end
    pop_dist(i) = d;                %�����ŵ�pop_dist
end

