function [ coordinates1, coordinates2 ] = get_matches_sifted( frames1, desc1, frames2, desc2 )

% find matches between a set of descriptors
[matches] = vl_ubcmatch(desc1, desc2);

% matches should be >= 8 (enforce later)

% return the frames that belong to matches, but only the coordinates
coordinates1 = frames1([1, 2], matches(1, :));
coordinates2 = frames2([1, 2], matches(2, :));

end

