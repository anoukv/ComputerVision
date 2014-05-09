im1 = read_image(1, false);
im2 = read_image(2, false);
im3 = read_image(3, false);

[matches1, matches2] = get_matches(im1, im2);
[matches3, matches4] = get_matches(im2, im3);

repeatedMatches2 = ismember(sum(ismember(matches2, matches3)), 2)