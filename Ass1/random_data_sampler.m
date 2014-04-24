function [ s ] = random_data_sampler( data, fraction )

if fraction > 0.98
    s = data;
else
    sample_size = int64(size(data,2) * fraction);
    s = datasample(data, sample_size, 2, 'Replace', false);
end

end
