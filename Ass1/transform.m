function [ R, t ] = transform( set1, set2 )

[R, t] = icp(set1, set2, [0.04, 0.08, 0.08, 0.12]' );
end

