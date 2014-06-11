function [ data1, data2 ] = getBodyData( prefix, sampler )

data1 = sample(cleanup(readPcd(strcat(prefix,'0000000050.pcd'))), 0.2, 'uniform');
data2 = sample(cleanup(readPcd(strcat(prefix,'0000000059.pcd'))), 0.2, 'uniform');

end

