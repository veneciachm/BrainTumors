module parameters
	integer Nx,Nt,Ny,Nz
	integer coefficient
	integer iter_time, Num_it

	real(kind=8) t,dt, courant 
	real(kind=8) xmin,xmax,dx, ymin, ymax, dy, zmax, zmin, dz 
	
	real(kind=8)  Dg, Dw, rho, kp !kp es el carrying capacity 
	real(kind=8), allocatable, dimension (:,:,:) :: x, y, z
	real(kind=8), allocatable, dimension (:,:,:) :: phi,phi_p, phi_pp
	real(kind=8), allocatable, dimension (:,:,:) :: D


	real (kind=8) D_dimensional, t_dimensional, rho_dimensional, r_tumorDimensional, r_tumorAdim 
	real (kind=8) FactorDimension_long     !regresa las longitudes codigo a longitudes fisicas
	
	real (kind=8) x_adim, y_adim, z_adim   !Tamaño del dominio en x, y y z SIN DIMENSIONES
	real (kind=8) DomainX_Dimensional, DomainY_Dimensional, DomainZ_Dimensional !Tamaño del dominio x, y y z CON DIMENSIONES
	
	real (kind=8) xTumorDimensional, yTumorDimensional, zTumorDimensional    !Lugar en que va a ir el tumor inicial en cada coordenada
	real (kind=8) xTumorAdim, yTumorAdim, zTumorAdim
	
	
	character (len=15) file_name2Dxy
	character (len=15) file_name2Dyz
	character (len=15) file_name2Dzx
end module





