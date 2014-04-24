function [  ] = demo(  )

figure; 
hold on;

path = '/Users/anoukvisser/dev/MATLAB/data/00000000';
prefix = '.pcd';
set1 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data/0000000000.pcd'));

plot3(set1(1,:),set1(2,:),set1(3,:),'bo');

for i=1:98
    
    set2 = set1;
    file = '';
    if i < 10
        file = strcat(file, '0');
    end
    file = strcat(file, int2str(i));
    set1 = cleanup(readPcd(strcat(strcat(path, file), prefix)));
    
    [R, t] = transform(set1, set2);
    newSet1 = R * set1 + repmat(t, 1, size(set1, 2));
    
    plot3(newSet1(1,:),newSet1(2,:),newSet1(3,:),'bo');
end

hold off;


end

