function [ data ] = sample( data, fraction, sampler )

if strcmp(sampler, 'fn')    
    data = furthest_neighbor_data_sampler(data, fraction);
elseif strcmp(sampler, 'random')
    data = random_data_sampler(data, fraction);
else
    data = uniform_data_sampler(data, fraction);
end


end

