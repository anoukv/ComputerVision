function [ data1, data2 ] = getBodyData(  )

if false
    data1 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data1/0000000050.pcd'));
    data2 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data1/0000000059.pcd'));
else
    data1 = cleanup(readPcd('/Users/Remi/Desktop/Master/Semester2/CV_data/Ass1/0000000050.pcd'));
    data2 = cleanup(readPcd('/Users/Remi/Desktop/Master/Semester2/CV_data/Ass1/0000000059.pcd'));
end

data1 = uniform_data_sampler(data1, 0.2);
data2 = uniform_data_sampler(data2, 0.2);

end

