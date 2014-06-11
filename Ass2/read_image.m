function [ image ] = read_image( index, house, prefix )

% house is a boolean that indicates if house image should be read,
% otherwise teddybear is read.
if house
    % Define number that is used in filename
    if index < 10
        number = strcat('0000000', int2str(index));
    else
        number = strcat('000000', int2str(index));
    end
    % Define filename
    image_file = strcat(prefix, 'House/frame', number, '.png');
    % read image
    image = im2single(imread(image_file));
else
    % Define number that is used in filename
    if index < 10
        number = strcat('00', int2str(index));
    else
        number = strcat('0', int2str(index));
    end
    % Define filename
    image_file = strcat(prefix, 'TeddyBear/obj02_', number, '.png');
    % read image
    image = im2single(rgb2gray(imread(image_file)));
    image = imresize(image, 0.25);
end

end

