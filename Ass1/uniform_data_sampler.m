function [ s ] = uniform_data_sampler( data, fraction )


% Define sample size
sample_size = int64(size(data,2) * fraction);

% Find the xyz min and max borders of the data


% Take sample_size points and find nearest neighbor.
kdtree = vl_kdtreebuild(data);



end

