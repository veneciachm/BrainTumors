# A numerical solution to the reaction-diffusion equation applied to brain tumors
Code capable of simulating numerically in three dimensions the spatio-temporal evolution of cancerous brain tumors, based on the reaction-diffusion equation and its numerical solution. The code was also tested to show the validity of the usage of reaction diffusion models for the study of this kind of tumors. It has the numerical tools that allow the use of anatomically realistic human brain geometries in three dimensions. The importance of a geometrically accurate anatomy lies in the fact that tumors diffuse at different speed in grey or white matter. Whit such anatomy, an analysis of the numerical evolution of different types of tumors undergoing diverse initial conditions and different positions inside the brain allows us to even estimate the deadliness of the simulated tumor. 
The results given by this code were verified by comparing them with previous numerical and clinical results. 

## Notes:
The whole project is composed of:
main.f90, defineD.f90, dimensionless_time.f90, discret_domain.f90, grid_lengths.f90, parameters.f90, read_parameters.f90 

Some saving files which will generate the output data: 
save2Dxy.f90, save2Dyz.f90 and save2Dzx.f90

Input files specifying some parameters and units:
input.par, units.par

A file to generate a plot with the resultig data:
NumericalMRI.gnu

And a Makefile to compile the project using:
```
make Tumor3D
```
which generates xTumor. To run it, type in the same folder:
```
./xTumor
```

Using the sugested parameters, the simulations will run for about an hour using only one core.  
