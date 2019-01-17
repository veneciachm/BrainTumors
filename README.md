# A numerical solution to the reaction-diffusion equation applied to brain tumors
Code capable of simulating numerically in three dimensions the spatio-temporal evolution of cancerous brain tumors, based on the reaction-diffusion equation and its numerical solution. The code was also tested to show the validity of the usage of reaction diffusion models for the study of this kind of tumors. It has the numerical tools that allow the use of anatomically realistic human brain geometries in three dimensions. The importance of a geometrically accurate anatomy lies in the fact that tumors diffuse at different speed in grey or white matter. With such anatomy, an analysis of the numerical evolution of different types of tumors undergoing diverse initial conditions and different positions inside the brain allows us to simulate the evolution of the tumor from early detection until metastasis. 
The results calculated with this code can be compared with previous numerical and clinical results. 

**How original is it?** ***Totally home made***, no libraries required.

### Notes:
Save all the files in the same directory and unzip the BrainGW file. This code uses Fortran 90 and produces output suitable for gnuplot as a visualizer.

## Project:
The whole project is composed of:
main.f90, defineD.f90, dimensionless_time.f90, discret_domain.f90, grid_lengths.f90, parameters.f90, read_parameters.f90 

Files generating the output data: 
save2Dxy.f90, save2Dyz.f90 and save2Dzx.f90

Input files specifying some parameters and units (with a short explanation for each parameter):
input.par, units.par

Another -essential- input file with information about anatomy of the brain which is interpreted with defineD.f90:
BrainGW

A file to generate a plot with the resulting data:
NumericalMRI.gnu

And a Makefile to compile the project that works using:
```
make Tumor3D
```
which generates the binary executable xTumor. To run it, type in the same folder:
```
./xTumor
```

Using the suggested parameters, the simulations will run for about 17 minutes (consider this serial version allows the use of only one core). 

### Plotting
To generate the plot, type
```
gnuplot NumericalMRI.gnu
```
that will produce an .eps file, similar to (h) of the next images. By doing some minor modifications to NumericalMRI.gnu the rest of the images can be obtained. 


![alt text](https://github.com/veneciachm/BrainTumors/blob/master/MRI-like.png)
