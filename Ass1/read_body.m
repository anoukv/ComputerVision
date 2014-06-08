function [ body ] = read_body( index )

if i > 99
    body = [];
else
    
    if false
        prefix = '/Users/Remi/Desktop/Master/Semester2/CV_data/Ass1/';
    else
        prefix = '/Users/anoukvisser/dev/MATLAB/data1/';
    end

    if index < 10
        number = strcat('000000000', int2str(index));
    else
        number = strcat('00000000', int2str(index));
    end
    bodyFile = strcat(prefix, number, '.pcd');
    body = cleanup(readPcd(bodyFile));
end

end