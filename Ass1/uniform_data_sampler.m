function [ samples ] = uniform_data_sampler( data, fraction )

if fraction > 0.98
    samples = data;
else
    % Define sample size
    step_size = ceil(1 / fraction);
    sample_size = size(data,2) / step_size;
    samples = zeros(3, sample_size);
    
    sample_index = 1;
    for i = 1:step_size:size(data,2)
        samples(:,sample_index) = data(:,i);
        sample_index = sample_index + 1;
    end
    
end
