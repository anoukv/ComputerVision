clear();

disp('Caching matches...');


all_matches_l=java.util.LinkedList;
li_l=all_matches_l.listIterator;
all_matches_r=java.util.LinkedList;
li_r=all_matches_r.listIterator;

[frames1, desc1] = get_foreground_sift(read_image(1, false));
for i=1:15
    i
    [frames2, desc2] = get_foreground_sift(read_image(i+1, false));
    [matches1, matches2] = get_matches_sifted(frames1, desc1, frames2, desc2);
    li_l.add(matches1);
    li_r.add(matches2);
    
    frames1 = frames2;
    desc1 = desc2;
end

[frames2, desc2] = get_foreground_sift(read_image(1, false));
[matches1, matches2] = get_matches_sifted(frames1, desc1, frames2, desc2);
li_l.add(matches1);
li_r.add(matches2);

% First bootstrap the process:
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

% Now perform the iterations:
disp('Iterating over images..');
for n=1:15
    k = n - 1; % one for index correction
    matches2 = all_matches_r.get(k);
    matches3 = all_matches_l.get(k+1);
    matches4 = all_matches_r.get(k+1);
    
    repeatedMatches = ismember(sum(ismember(matches3, matches2)), 2);

    for i=1:size(matches4, 2)
        if repeatedMatches(i) == 1
            points([p1-2 p2-2], :);
            thePoint = matches3(:, i);
            backIndex = find(ismember(sum(ismember(points, thePoint)), 2));
            if size(backIndex) > 0
                for bi=1:size(backIndex)
                    result([im1 im2], backIndex(bi)) = 1;
                    points([p1 p2], backIndex(bi)) = matches4(:, i);
                end
            end
        else
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



for i=1:5
    result = kron(result,[1;1]);
end

imshow(result);

