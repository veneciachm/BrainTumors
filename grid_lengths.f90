subroutine grid_lengths()	
	use parameters
	implicit none

	open(10, file='units.par')
	
	
	read(10,*), D_dimensional
	read(10,*), DomainX_Dimensional
	read(10,*), DomainY_Dimensional
	read(10,*), DomainZ_Dimensional
	read(10,*), t_dimensional
	read(10,*), rho_dimensional
	!----------------------- Tumor radion in centimeters --------------------
	read(10,*), r_tumorDimensional
	!------------------------- Tumor location un cm ------------------------
	read(10,*), xTumorDimensional
	read(10,*), yTumorDimensional	 
	read(10,*), zTumorDimensional
	
	close (10)
	
	if (rho_dimensional.eq.0.0d0) then
		!----------- Spatial domain IN GRID UNITS without proliferation ------------------
		x_adim = 1.0d0   
		y_adim = 1.0d0
		z_adim = 1.0d0
		r_tumorAdim=r_tumorDimensional/DomainX_Dimensional
		!------------------- POSITION OF THE TUMOR in grid units -------------------------
		xTumorAdim = xTumorDimensional/DomainX_Dimensional         
		yTumorAdim = yTumorDimensional/DomainY_Dimensional
		zTumorAdim = zTumorDimensional/DomainY_Dimensional
	else 
		!----------- Spatial domain IN GRID UNITS with proliferation ------------------
		x_adim=sqrt(rho_dimensional/D_dimensional)*DomainX_Dimensional		
		y_adim=sqrt(rho_dimensional/D_dimensional)*DomainY_Dimensional
		z_adim=sqrt(rho_dimensional/D_dimensional)*DomainZ_Dimensional
		
						
		r_tumorAdim=sqrt(rho_dimensional/D_dimensional)*r_tumorDimensional
		!------------------- POSITION OF THE TUMOR in grid units -------------------------		
		xTumorAdim = sqrt(rho_dimensional/D_dimensional)* xTumorDimensional       
		yTumorAdim = sqrt(rho_dimensional/D_dimensional)* yTumorDimensional	
		zTumorAdim = sqrt(rho_dimensional/D_dimensional)* zTumorDimensional	
	end if 
	!-------------------------------------- re-scaling factor ----------------------------
	FactorDimension_long= 1.0d0/( sqrt(rho_dimensional/D_dimensional) )
	
	xmax = x_adim/2.0d0
	ymax = y_adim/2.0d0
	zmax = z_adim/2.0d0
	
	xmin = -x_adim/2.0d0
	ymin = -y_adim/2.0d0
	zmin = -z_adim/2.0d0
		
end subroutine 
