function [ new ] = get_point_view_matrix()


all_matches_l=java.util.LinkedList;
li_l=all_matches_l.listIterator;
all_matches_r=java.util.LinkedList;
li_r=all_matches_r.listIterator;

[frames1, desc1] = get_foreground_sift(read_image(1, false));
for i=1:15
    i
    [frames2, desc2] = get_foreground_sift(read_image(i+1, false));
    [matches1, matches2] = get_matches_sifted(frames1, desc1, frames2, desc2);
    li_l.add(center(matches1));
    li_r.add(center(matches2));
    
    frames1 = frames2;
    desc1 = desc2;
end

[frames2, desc2] = get_foreground_sift(read_image(1, false));
[matches1, matches2] = get_matches_sifted(frames1, desc1, frames2, desc2);
li_l.add(center(matches1));
li_r.add(center(matches2));

% First bootstrap the process:
disp('Bootstrapping..');
index = 1;

%p1 = 1;
%p2 = 2;

resultX = zeros(16, 0);
resultY = zeros(16, 0);

camera = 1;

matches1 = all_matches_l.get(0);
matches2 = all_matches_r.get(0);

points = zeros(0,0);
for i=1:size(matches1, 2)
    resultX(camera, index) = matches1(1, i);
    resultY(camera, index) = matches1(2, i);
    resultX(camera+1, index) = matches2(1, i);
    resultY(camera+1, index) = matches2(2, i);
    %points([p1 p2], index) = matches1(:, i);
    %points([p1+2 p2+2], index) = matches2(:, i);
    index = index + 1;
end

% increment everything
camera = 3;

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
            thePoint = matches3(:, i);
            backIndex = find(ismember(sum(ismember(points, thePoint)), 2));
            if size(backIndex) > 0
                for bi=1:size(backIndex)
                    resultX(camera, backIndex(bi)) = matches4(1, i);
                    resultY(camera, backIndex(bi)) = matches4(2, i);
                    %points([p1 p2], backIndex(bi)) = matches4(:, i);
                end
            end
        else
            resultX(camera-1, index) = matches3(1, i);
            resultY(camera-1, index) = matches3(2, i);
            resultX(camera, index) = matches4(1, i);
            resultY(camera, index) = matches4(2, i);
            %points([p1 p2], index) = matches3(:, i);
            %points([p1+2 p2+2], index) = matches4(:, i);
            index = index + 1;
        end
    end

    %p1 = p1 + 4;
    %p2 = p2 + 4;
    camera = camera + 1;
    
end

%numberOfCameras = size(points, 1);
%nums = linspace(1, numberOfCameras, numberOfCameras);
%uneven = nums(1:2:end);
%even = nums(2:2:end);
%new = [points(uneven, :); points(even, :)];
new = [resultX ; resultY];


end

