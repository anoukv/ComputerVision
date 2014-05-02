clear()
im1 = read_image(1, true);
im2 = read_image(2, true);
[matches1, matches2] = get_matches(im1, im2);
plotMatches(im1, im2, matches1, matches2);
FStart = eightPoint(matches1, matches2)
FNorm = eightPointNormalized(matches1, matches2)

