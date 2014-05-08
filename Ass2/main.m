clear()
im1 = read_image(1, true);
im2 = read_image(2, true);
[matches1, matches2] = get_matches(im1, im2);
%plotMatches(im1, im2, matches1, matches2);

FStart = eightPoint(matches1, matches2)
FNorm = eightPointNormalized(matches1, matches2)
FRansac = eightPointRansac(matches1, matches2, 300, 0.1)

[matches1, matches2] = get_matches(read_image(1, true), read_image(25, true));
F = eightPoint(matches1, matches2);

