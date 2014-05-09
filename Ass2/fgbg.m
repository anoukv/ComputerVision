clear()
im1 = read_image(1, false);
im2 = read_image(2, false);
[matches1, matches2] = get_foreground_matches(im1, im2);
plotMatches(im1, im2, matches1, matches2);