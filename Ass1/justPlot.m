% Just plot them all

path = '/Users/anoukvisser/dev/MATLAB/data1/00000000';
prefix = '.pcd';

figure
hold on
for i=0:99
    i
    file = '';
    if i < 10
        file = strcat(file, '0');
    end    
    file = strcat(file, int2str(i));
    set = cleanup(readPcd(strcat(strcat(path, file), prefix)));
    set = uniform_data_sampler(set, 0.001);
    size(set)
    plot3(set(1, :), set(2, :), set(3, :), 'bo')
end
hold off