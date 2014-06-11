function [ new ] = get_point_view_matrix()
%% TO BE COMENTED BY REMI
image1 = read_image(1, false);
image2 = read_image(2, false);

[ matches1, matches2 ] = get_foreground_matches( image1, image2 );

Xpoints = zeros(0,0);
Ypoints = zeros(0,0);

pointIndexer = 1;
imageIndexer = 1;

for i=1:size(matches1, 2)
    
    Xpoints(imageIndexer, pointIndexer) =  matches1(1, i);
    Ypoints(imageIndexer, pointIndexer) =  matches1(2, i);
    XPoints(imageIndexer+1, pointIndexer) = matches2(1, i);
    YPoints(imageIndexer+1, pointIndexer) = matches2(2, i);
    
    pointIndexer = pointIndexer + 1;
end

previousMatches = matches2;

for n=2:5
    n
    imageIndexer = imageIndexer + 1;
    
    image1 = read_image(n, false);
    image2 = read_image(n+1, false);
    [ matches1, matches2 ] = get_foreground_matches( image1, image2 );
    
    repeatedMatches = ismember(matches1', previousMatches', 'rows')';
    
    for i=1:size(repeatedMatches, 2)
        if repeatedMatches(i) == 1
            observedPoint = matches1(:, i);
            relevantXRow = XPoints(imageIndexer, :);
            relevantYRow = YPoints(imageIndexer, :);
            observedPoints = [relevantXRow;relevantYRow];
            backIndex = find(ismember(observedPoints', observedPoint', 'rows')');
            % check the size of backIndex
            %Xpoints(imageIndexer, backIndex) =  matches1(1, i);
            %Ypoints(imageIndexer, backIndex) =  matches1(2, i);
            XPoints(imageIndexer+1, backIndex) = matches2(1, i);
            YPoints(imageIndexer+1, backIndex) = matches2(2, i);
            
        else
            Xpoints(imageIndexer, pointIndexer) = matches1(1, i);
            Ypoints(imageIndexer, pointIndexer) = matches1(2, i);
            Xpoints(imageIndexer+1, pointIndexer) = matches2(1, i);
            Ypoints(imageIndexer+1, pointIndexer) = matches2(2, i);
            pointIndexer = pointIndexer + 1;
        end
    end
    
    previousMatches = matches2;
    
end

new = [Xpoints; Ypoints];

size(new)

end

