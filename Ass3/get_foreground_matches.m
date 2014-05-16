function [ coordinates1, coordinates2 ] = get_foreground_matches( image1, image2 )

[frames1, desc1] = vl_sift(image1);
[frames2, desc2] = vl_sift(image2);

foreground1 = getForeground(image1);
foreground2 = getForeground(image2);

[frames1, desc1] = dropBackgroundPoints(foreground1, frames1, desc1);
[frames2, desc2] = dropBackgroundPoints(foreground2, frames2, desc2);

[matches] = vl_ubcmatch(desc1, desc2);

% matches should be >= 8 (enforce later)

coordinates1 = frames1([1, 2], matches(1, :));
coordinates2 = frames2([1, 2], matches(2, :));

end

