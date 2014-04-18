function [ rms ] = RMS( base, target )
% something to think about
% target should be the points that are mapped to the same
% row as the corresponding point in base

% first find all the square norms form the base and target
norms = sum(power((base - target), 2));

% take the mean of the norms, and take the sqrt
rms = sqrt(mean(norms));


end

