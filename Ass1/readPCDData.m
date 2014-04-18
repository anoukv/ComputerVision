function [ all_PCD ] = readPCDData( dirname )

all_PCD = {};

listing = dir(strcat(dirname, '*.pcd'));

count = 1;
for i=1:size(listing)
    file = fullfile(pwd, dirname, listing(i).name);
    if size(strfind(file, '_normal'),1) == 0
        these_points = readPcd(file);
        these_points = these_points(these_points(:, 3) < 2, :);
        these_points = [these_points(:, 1), these_points(:, 2), these_points(:, 3)];
        all_PCD{count} = these_points;
        count = count + 1;
    end
end

end

