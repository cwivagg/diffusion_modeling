function [ newPoint ] = projectOnCylinder( oldPoint, cellWidth )

% This function takes arbitrary points in space and projects them onto a
% cylinder of width $cellWidth centered around the X-axis.

r = cellWidth/2*ones(size(oldPoint,1),2);

newPoint = oldPoint;
newPoint(:,2:3) = oldPoint(:,2:3).*r ./ (sqrt(sum(oldPoint(:,2:3).^2,2))*ones(1,2));

end

