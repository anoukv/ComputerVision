function [ coordinates1, coordinates2 ] = get_foreground_matches( image1, image2 )

% extract SIFT features and descriptors from both images
[frames1, desc1] = vl_sift(image1);
[frames2, desc2] = vl_sift(image2);

% get the foreground from both images
foreground1 = getForeground(image1);
foreground2 = getForeground(image2);

% drop backgground points and obtain new (fewer) frames and descriptors
[frames1, desc1] = dropBackgroundPoints(foreground1, frames1, desc1);
[frames2, desc2] = dropBackgroundPoints(foreground2, frames2, desc2);

% match the remaining interest points
[matches] = vl_ubcmatch(desc1, desc2);

% matches should be >= 8 (enforce later)
% only return the coordinates, not rotation and scale
coordinates1 = frames1([1, 2], matches(1, :));
coordinates2 = frames2([1, 2], matches(2, :));

end

