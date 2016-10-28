function boolAnswer = inCylinder( point, cellLength, cellWidth )
% This function is vectorized.
rodLimit = ones(size(point,1),1)*(cellLength-cellWidth)/2;

boolAnswer = ((point(:,1) <= rodLimit) & (point(:,1) >= -rodLimit));