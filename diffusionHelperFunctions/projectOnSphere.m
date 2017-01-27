function [ newPoint ] = projectOnSphere( oldPoint, cellLength, cellWidth )

% This function projects arbitrary points in space onto the surface of a
% sphere split in two and translated -/+ $cellLength from the origin along
% the X-axis.

rodLimit = ones(size(oldPoint,1),1)*(cellLength-cellWidth)/2;
r = cellWidth/2*ones(size(oldPoint,1),3);

northPoints = oldPoint(:,1)>=rodLimit;
southPoints = oldPoint(:,1)<rodLimit;

rodLimit = ones(sum(northPoints,1),1)*(cellLength-cellWidth)/2;
oldPoint(northPoints,1) = oldPoint(northPoints,1) - rodLimit;
rodLimit = ones(sum(southPoints,1),1)*(cellLength-cellWidth)/2;
oldPoint(southPoints,1) = oldPoint(southPoints,1) + rodLimit;

newPoint = oldPoint.*r ./ (sqrt(sum(oldPoint.^2,2))*ones(1,3));

rodLimit = ones(sum(northPoints,1),1)*(cellLength-cellWidth)/2;
newPoint(northPoints,1) = newPoint(northPoints,1) + rodLimit;
rodLimit = ones(sum(southPoints,1),1)*(cellLength-cellWidth)/2;
newPoint(southPoints,1) = newPoint(southPoints,1) - rodLimit;

end