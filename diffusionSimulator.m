function [ trajectories ] = diffusionSimulator( D );

% This script simulates the diffusion of protein molecules on the membrane
% of a bacterial cell.

% The cell is a sphere divided in two with a cylinder interposed between; the
% cylinder's axis runs parallel to the x axis.

%D = 10;
dt = 0.000022;
cellWidth = 0.65;
cellLength = 2;
r = cellWidth / 2;
l = cellLength;
pStartInCaps = 4*pi*r^2 / (4*pi*r^2+2*pi*r*l);
fprintf('Fraction of cell in caps is %0.2f\n', pStartInCaps);

numberOfPoints = 25;
numberOfSteps = 10000;
trajectories = zeros(numberOfPoints,3,numberOfSteps);

elevation = asin(2*rand(numberOfPoints,1)-1);
azimuth = 2*pi*rand(numberOfPoints,1);
[x,y,z] = sph2cart(azimuth,elevation,r);
extendedX = x + ones(size(x))*(cellLength-cellWidth)/2;
x(x>0) = extendedX(x>0);
extendedX = x - ones(size(x))*(cellLength-cellWidth)/2;
x(x<=0) = extendedX(x<=0);

x2 = (cellLength-cellWidth)/2*(2*rand(numberOfPoints,1)-1);
radiusPosition = 2*pi*rand(numberOfPoints,1);
[y2,z2] = pol2cart(radiusPosition,r);

pointsInCylinder = rand(numberOfPoints,1)>pStartInCaps;

x(pointsInCylinder) = x2(pointsInCylinder);
y(pointsInCylinder) = y2(pointsInCylinder);
z(pointsInCylinder) = z2(pointsInCylinder);

trajectories(:,:,1) = [x,y,z];
for i = 1:(numberOfSteps-1)
   oldPoint = trajectories(:,:,i);
   u = zeros(size(oldPoint,1),3); v = u; 
   oldPointsInCylinder = inCylinder(oldPoint,cellLength,cellWidth);
   [u(oldPointsInCylinder,:),v(oldPointsInCylinder,:)] = circleOnCylinder(oldPoint(oldPointsInCylinder,:));
   [u(~oldPointsInCylinder,:),v(~oldPointsInCylinder,:)] = circleOnSphere(oldPoint(~oldPointsInCylinder,:),cellLength,cellWidth);
   circlePoint = randPointOnCircle(oldPoint,u,v,D*dt);
   newPoint = oldPoint;
   circlePointsInCylinder = inCylinder(circlePoint,cellLength,cellWidth);
   newPoint(circlePointsInCylinder,:) = projectOnCylinder(circlePoint(circlePointsInCylinder,:),cellWidth);
   newPoint(~circlePointsInCylinder,:) = projectOnSphere(circlePoint(~circlePointsInCylinder,:),cellLength,cellWidth);
   trajectories(:,:,i+1) = newPoint;
end

return