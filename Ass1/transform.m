function [ R, t ] = transform( set1, set2 )

R = eye(3, 3);
t = zeros(3, 1);

sample1 = uniform_data_sampler(set1, 0.05);
sample2 = uniform_data_sampler(set2, 0.05);
[R, t] = icp(sample1, sample2, 2, R, t );

sample1 = uniform_data_sampler(set1, 0.15);
sample2 = uniform_data_sampler(set2, 0.15);
[R, t] = icp(sample1, sample2, 2, R, t );

sample1 = uniform_data_sampler(set1, 0.25);
[R, t] = icp(sample1, sample2, 2, R, t );

end

