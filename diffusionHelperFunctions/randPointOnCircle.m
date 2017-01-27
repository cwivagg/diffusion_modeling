function [ newPoint ] = randPointOnCircle( oldPoint, u, v, Ddt )

% This function generates a particle diffusing according to D in time
% interval dt on the plane specified by circleEquation (u,v) from starting point
% oldPoint.
% r(t) = <x0,y0,z0>+rcos(t)*u+rsin(t)*v

randrs = 4*Ddt*randn(size(oldPoint,1),1);
randts = 2*pi*rand(size(oldPoint,1),1);

newPoint = oldPoint + randrs.*cos(randts)*ones(1,3).*u + randrs.*sin(randts)*ones(1,3).*v;

end

