function [ frames, desc ] = get_foreground_sift( image )

[frames, desc] = vl_sift(image);
foreground = getForeground(image);
[frames, desc] = dropBackgroundPoints(foreground, frames, desc);

end

