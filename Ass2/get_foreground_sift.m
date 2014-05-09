function [ frames, desc ] = get_foreground_sift( image )

[frames, desc] = vl_sift(image);
foreground = getForeground(image1);
[frames, desc] = dropBackgroundPoints(foreground, frames, desc);

end

