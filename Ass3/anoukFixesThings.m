% maybe we shouldn't have zeros but make a VERY limited selection...? 

house1 = read_image(1, true);
house2 = read_image(2, true);
[coords1, coords2] = get_matches(house1, house2);