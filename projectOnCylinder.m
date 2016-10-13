function [ newPoint ] = projectOnCylinder( oldPoint, cellWidth )

r = cellWidth/2*ones(size(oldPoint,1),2);

newPoint = oldPoint;
newPoint(:,2:3) = oldPoint(:,2:3).*r ./ (sqrt(sum(oldPoint(:,2:3).^2,2))*ones(1,2));

end

