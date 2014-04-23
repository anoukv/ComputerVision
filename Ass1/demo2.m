function [  ] = demo2(  )

figure; 
hold on;

path = '/Users/anoukvisser/dev/MATLAB/data/00000000';
prefix = '.pcd';
accset = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data/0000000000.pcd'));

plot3(accset(1,:),accset(2,:),accset(3,:),'bo');

for i=1:3
    i
    file = '';
    
    if i < 10
        file = strcat(file, '0');
    end
    
    file = strcat(file, int2str(i));
    set = cleanup(readPcd(strcat(strcat(path, file), prefix)));
    
    [R, t] = transform(set, accset);
    newSet = R * set + repmat(t, 1, size(set, 2));
    
    plot3(newSet(1,:),newSet(2,:),newSet(3,:),'bo');
    
    accset = [accset, newSet];
end

hold off;


end




