function [ rms ] = RMS( base, target )

norms = sum(power((base' - target'), 2));
rms = sqrt(mean(norms));


end

