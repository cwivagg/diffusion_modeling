function [ normVector1, normVector2 ] = circleOnCylinder( startingPoint )
% This function is vectorized.
zero = zeros(size(startingPoint,1),1);
one = ones(size(startingPoint,1),1);
% The plane 2y0(y-y0)+2z(z-z0) = 0 is the tangent plane to a cylinder
% centered around the x axis.
%    equationOfPlane stores this in the form ax + by + cz = d
equationOfPlane = [ zero, 2*startingPoint(:,2), 2*startingPoint(:,3), ...
                    2*startingPoint(:,2).^2+2*startingPoint(:,3).^2 ];
% First two zeros were formerly startingPoint(:,1), i.e. x0. They should be
% able to be anything for the cylinder case.
startingVector1 = [ zero, one, (equationOfPlane(:,4)-equationOfPlane(:,2))./equationOfPlane(:,3) ];
startingVector2 = [ one, (equationOfPlane(:,4)-equationOfPlane(:,3))./equationOfPlane(:,2), one ];

normVector1 = startingVector1 ./ (sqrt(sum(startingVector1.^2,2))*ones(1,3));
% Project vector2 onto vector1.
projVector2 = normVector1 .* (dot(normVector1,startingVector2,2)*ones(1,3));
% Find the perpendicular to vector1.
perpVector2 = startingVector2 - projVector2;
normVector2 = perpVector2 ./ (sqrt(sum(perpVector2.^2,2))*ones(1,3));