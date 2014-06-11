function [ M, S ] = factorizaion( D )

% construct centered meas
%D = [points1(1, :); points2(1, :); points1(2, :); points2(2, :)];

[U, W, V] = svd(D);

V = V';
% UP should be 2*M * 3
Up = U(:, 1:3); 
% should be 3*3
Wp = W(1:3, 1:3);
% or do we need to do this on V'?
% should be 3xN
Vp = V(1:3, :);

M = Up * Wp.^(1/2);
S = Wp.^(1/2) * Vp;

end

