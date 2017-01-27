function boolAnswer = inCylinder( point, cellLength, cellWidth )

% For an arbitrary list of points, this function determines whether they
% lie in the straight part of a cylinder with rounded ends.

% This function is vectorized.
rodLimit = ones(size(point,1),1)*(cellLength-cellWidth)/2;

boolAnswer = ((point(:,1) <= rodLimit) & (point(:,1) >= -rodLimit));