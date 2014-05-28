clear();

% now we need to do this for multiple points using chaining.
% A number of issues:
% we did not save the actual points/coordinates, that is slightly 
% unfortunate but we can probably reason about that since we are saving
% the 'even' frames I believe.
% Then, how do we visualize this thing? Is S supposed to be a teddy bear?
% From the assignment: "Remember to enable a sufficient number of points 
% that persist throughout the sequence to perform the factorization on a 
% dense matrix. There is no need to fill in missing data for this problem.
D = get_point_view_matrix();
[M, S] = factorizaion2(D);
plot3(S(1, :), S(2, :), S(3, :), 'bo');

%plotMatches(I1, I2, coords1, coords2);