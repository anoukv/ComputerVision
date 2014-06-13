clear();

disp('Caching matches...');

% Define prefix of where images are located
prefix = '/Users/Remi/Desktop/Master/Semester2/CV_data/Ass2/';
% prefix = '/Users/anoukvisser/dev/MATLAB/data2/';


% Define a java list which will be filled with point matches.
all_matches_l=java.util.LinkedList;
li_l=all_matches_l.listIterator;
all_matches_r=java.util.LinkedList;
li_r=all_matches_r.listIterator;

% loop over alle image pairs, cache the sift descriptors and see which
% points match.
[frames1, desc1] = get_foreground_sift(read_image(1, false, prefix));
for i=1:15
    i
    [frames2, desc2] = get_foreground_sift(read_image(i+1, false, prefix));
    [matches1, matches2] = get_matches_sifted(frames1, desc1, frames2, desc2);
    li_l.add(matches1);
    li_r.add(matches2);
    
    frames1 = frames2;
    desc1 = desc2;
end

[frames2, desc2] = get_foreground_sift(read_image(1, false, prefix));
[matches1, matches2] = get_matches_sifted(frames1, desc1, frames2, desc2);
li_l.add(matches1);
li_r.add(matches2);


% First bootstrap the process by initializing the result matrix with the
% matches of the first image.
disp('Bootstrapping..');
index = 1;

im1 = 1;
im2 = 2;

p1 = 1;
p2 = 2;

matches1 = all_matches_l.get(0);
matches2 = all_matches_r.get(0);

result = zeros(0,0);
points = zeros(0,0);
for i=1:size(matches2, 2)
    result([im1 im2], index) = 1;
    points([p1 p2], index) = matches2(:, i);
    index = index + 1;
end

% increment everything
im1 = im1 + 1;
im2 = im2 + 1;
p1 = p1 + 2;
p2 = p2 + 2;

% Now perform the iterations.
% Here we find the matches and store the new ones in 'points'. We add the
% ones that were already seen to the results.
disp('Iterating over images..');
for n=1:15
    matches2 = all_matches_r.get(k-1);
    matches3 = all_matches_l.get(k);
    matches4 = all_matches_r.get(k);
    
    repeatedMatches = ismember(matches3', matches2', 'rows')'; 

    for i=1:size(matches4, 2)
        if repeatedMatches(i) == 1 
            % Point was seen before
            thePoint = matches3(:, i);
            relevantRows = points([p1 - 2 p2 - 2], :);
            backIndex = find(ismember(relevantRows', thePoint', 'rows')');
            if size(backIndex) > 0
                for bi=1:size(backIndex)
                    result([im1 im2], backIndex(bi)) = 1;
                    points([p1 p2], backIndex(bi)) = matches4(:, i);
                end
            end
        else
            % Point is new
            result([im1 im2], index) = 1;
            points([p1 p2], index) = matches4(:, i);
            index = index +1;
        end
    end

    im1 = im1 + 1;
    im2 = im2 + 1;
    p1 = p1 + 2;
    p2 = p2 + 2;
    
end


% This loop is to make the rows of result more dense so that we can get a
% nice plot.
for i=1:5
    result = kron(result,[1;1]);
end

size(points, 1) / 2

imshow(result);

