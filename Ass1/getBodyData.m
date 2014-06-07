function [ data1, data2 ] = getBodyData(  )

<<<<<<< HEAD
if false
    data1 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data1/0000000050.pcd'));
    data2 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data1/0000000059.pcd'));
=======
if true
    data1 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data1/0000000000.pcd'));
    data2 = cleanup(readPcd('/Users/anoukvisser/dev/MATLAB/data1/0000000010.pcd'));
>>>>>>> 57344d56bcc367b0c57f6c048075d36406a61fa6
else
    data1 = cleanup(readPcd('/Users/Remi/Desktop/Master/Semester2/CV_data/Ass1/0000000050.pcd'));
    data2 = cleanup(readPcd('/Users/Remi/Desktop/Master/Semester2/CV_data/Ass1/0000000059.pcd'));
end

data1 = uniform_data_sampler(data1, 0.2);
data2 = uniform_data_sampler(data2, 0.2);

end

