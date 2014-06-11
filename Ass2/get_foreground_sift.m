function [ frames, desc ] = get_foreground_sift( image )
% get SIFT features
[frames, desc] = vl_sift(image);
% get the foreground 'map'
foreground = getForeground(image);
% drop SIFT features that were in the backround
[frames, desc] = dropBackgroundPoints(foreground, frames, desc);

end

