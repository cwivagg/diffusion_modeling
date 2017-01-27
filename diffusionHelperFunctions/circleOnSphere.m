function [ normVector1, normVector2 ] = circleOnSphere( startingPoint, cellLength, cellWidth )

% For a given vector of points in space, this function assumes the points
% to be located on the surface of a sphere split in two and translated -/+
% $cellLength from the origin along the X-axis.

% The function returns a pair of vectors specifying the normal plane to
% that sphere at each point.

% This function is vectorized.
% See circleOnCylinder for calculation explanations.

zero = zeros(size(startingPoint,1),1);
one = ones(size(startingPoint,1),1);

rodLimit = (cellLength-cellWidth)/2*ones(size(startingPoint,1),1);
positiveCapPoints = startingPoint(startingPoint(:,1)>rodLimit,:);
negativeCapPoints = startingPoint(startingPoint(:,1)<=rodLimit,:);

rodLimit = (cellLength-cellWidth)/2*ones(size(positiveCapPoints,1),1);
equationOfPositivePlane = [ 2*positiveCapPoints(:,1)-2*rodLimit, 2*positiveCapPoints(:,2), 2*positiveCapPoints(:,3), 2*positiveCapPoints(:,2).^2+2*positiveCapPoints(:,3).^2+(2*positiveCapPoints(:,1)-2*rodLimit).*positiveCapPoints(:,1) ];
rodLimit = (cellLength-cellWidth)/2*ones(size(negativeCapPoints,1),1);
equationOfNegativePlane = [ 2*negativeCapPoints(:,1)+2*rodLimit, 2*negativeCapPoints(:,2), 2*negativeCapPoints(:,3), 2*negativeCapPoints(:,2).^2+2*negativeCapPoints(:,3).^2+(2*negativeCapPoints(:,1)+2*rodLimit).*negativeCapPoints(:,1) ];
equationOfPlane = zeros(size(startingPoint,1),4);
rodLimit = (cellLength-cellWidth)/2*ones(size(startingPoint,1),1);
equationOfPlane(startingPoint(:,1)>rodLimit,:) = equationOfPositivePlane;
equationOfPlane(startingPoint(:,1)<=rodLimit,:) = equationOfNegativePlane;

startingVector1 = [ one, zero, (equationOfPlane(:,4)-equationOfPlane(:,1))./equationOfPlane(:,3) ];
startingVector2 = [ one, (equationOfPlane(:,4)-equationOfPlane(:,1))./equationOfPlane(:,2), zero ];

normVector1 = startingVector1 ./ (sqrt(sum(startingVector1.^2,2))*ones(1,3));
projVector2 = normVector1 .* (dot(normVector1,startingVector2,2)*ones(1,3));
perpVector2 = startingVector2 - projVector2;
normVector2 = perpVector2 ./ (sqrt(sum(perpVector2.^2,2))*ones(1,3));