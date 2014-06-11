clear()
im1 = read_image(1, false);
im2 = read_image(2, false);
[matches1, matches2] = get_foreground_matches(im1, im2);
%plotMatches(im1, im2, matches1, matches2);
tic
FStart = eightPoint(matches1, matches2)
toc
det(FStart)
tic
FNorm = eightPointNormalized(matches1, matches2)
toc
det(FNorm)
tic
FRansac = eightPointRansac(matches1, matches2, 300, 0.001)
toc
det(FRansac)