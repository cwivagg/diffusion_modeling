# diffusion_modeling
Membrane Diffusion Modeling

These functions, which can be sampled using diffusionExample.m, simulate the diffusion of a particle on the surface of a rod-shaped bacterium. The rod shape is simulated using a cylinder with a hemisphere of equal radius at each end to form a continuous surface.

Diffusive steps are simulated by taking a particle at an arbitrary point on the surface and moving it at a random angle and for a random distance (determined by a Gaussian distribution from a diffusion coefficient) on a plane tangent to the surface, and then projecting it back onto the surface.

This is an approximation of true diffusion; true diffusion could be modeled by moving the particle for half of D in the axial and radial directions on the cylindrical portion of the rod and by moving it by D in a 3-sphere the surface of which is the 2-sphere that is the bacterial surface. The latter computation, however, is too complicated to implement for present purposes. Theoretical work indicates that planar projection is acceptable given that the number of steps taken per unit time is sufficiently large.1

1) Carlsson, Tobias; Ekholm, Tobias; Elvingson, Christer. 29/1/2010. "Algorithm for generating a Brownian motion on a sphere". Journal of Physics A-Mathematical and Theoretical 50(43).