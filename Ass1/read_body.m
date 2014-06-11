function [ body ] = read_body( index, prefix )
%% TO BE COMMENTED BY REMI

if i > 99
    body = [];
else
    if index < 10
        number = strcat('000000000', int2str(index));
    else
        number = strcat('00000000', int2str(index));
    end
    bodyFile = strcat(prefix, number, '.pcd');
    body = cleanup(readPcd(bodyFile));
    body = uniform_data_sampler(body, 1.0);
end

end