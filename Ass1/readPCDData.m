function [ all_PCD ] = readPCDData( dirname )

all_PCD = [];

listing = dir(strcat(dirname, '*.pcd'));

for i=1:size(listing)
    file = fullfile(pwd, dirname, listing(i).name);
    if size(strfind(file, '_normal'),1) == 0
        these_points = readPcd(file);
        all_PCD = [all_PCD; these_points];
    end
end

end

