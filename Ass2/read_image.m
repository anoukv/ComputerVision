function [ image ] = read_image( index, house, prefix )

if house
    if index < 10
        number = strcat('0000000', int2str(index));
    else
        number = strcat('000000', int2str(index));
    end
    image_file = strcat(prefix, 'House/frame', number, '.png');
    image = im2single(imread(image_file));
else
    if index < 10
        number = strcat('00', int2str(index));
    else
        number = strcat('0', int2str(index));
    end
    image_file = strcat(prefix, 'TeddyBear/obj02_', number, '.png');
    image = im2single(rgb2gray(imread(image_file)));
    image = imresize(image, 0.25);
end

%image = im2single(rgb2gray(imread(image_file)));

end

