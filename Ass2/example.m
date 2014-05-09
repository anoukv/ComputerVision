clear()

% 1 - 2
matches1 = [1, 2, 3;4, 5, 6];
matches2 = [7, 8, 9;10, 11, 12];

% 2 - 3
matches3 = [6, 7, 8;9, 10, 13];
matches4 = [1, 2, 3; 4, 5, 6];

%3 - 4
matches5 = [1, 3, 6;10, 6, 9];
matches6 = [10, 11, 12; 13, 14, 10];


index = 1;

im1 = 1;
im2 = 2;

p1 = 1;
p2 = 2;


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
    

repeatedMatches = ismember(sum(ismember(matches3, matches2)), 2);

for i=1:size(matches4, 2)
    if repeatedMatches(i) == 1
        points([p1-2 p2-2], :);
        thePoint = matches3(:, i);
        backIndex = find(ismember(sum(ismember(points, matches3)), 2));
        result([im1 im2], backIndex) = 1;
        points([p1 p2], backIndex) = matches4(:, i);
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


repeatedMatches = ismember(sum(ismember(matches5, matches4)), 2);

for i=1:size(matches6, 2)
    if repeatedMatches(i) == 1
        points([p1-2 p2-2], :);
        thePoint = matches5(:, i);
        backIndex = find(ismember(sum(ismember(points, matches5)), 2));
        result([im1 im2], backIndex) = 1;
        points([p1 p2], backIndex) = matches6(:, i);
    else
        result([im1 im2], index) = 1;
        points([p1 p2], index) = matches6(:, i);
        index = index +1;
    end
end
points
result