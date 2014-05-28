function [ coordinates1, coordinates2 ] = get_matches_sifted( frames1, desc1, frames2, desc2 )

[matches] = vl_ubcmatch(desc1, desc2);

% matches should be >= 8 (enforce later)

coordinates1 = frames1([1, 2], matches(1, :));
coordinates2 = frames2([1, 2], matches(2, :));

end

