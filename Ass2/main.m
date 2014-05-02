
[matches1, matches2] = get_matches(read_image(1, true), read_image(2, true));
F = eightPoint(matches1, matches2);
