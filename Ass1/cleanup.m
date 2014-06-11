function [ dataOut ] = cleanup( dataIn )

% discard invalid depth data
dataOut = dataIn(dataIn(:, 3) < 1.0, :);

% we won't be using the 4th dimension
dataOut = dataOut(:, 1:3);

% transpose the whole thing
dataOut = dataOut';


end

