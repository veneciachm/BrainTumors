!-----------------------------------------------------------------------------------------
subroutine dimensionless_time() 
	use parameters
	implicit none
	real (kind=8) t_adim
	open(10, file='units.par')
	read(10,*), D_dimensional
	read(10,*), DomainX_Dimensional
	read(10,*), DomainY_Dimensional
	read(10,*), Domainz_Dimensional
	read(10,*), t_dimensional
	read(10,*), rho_dimensional
	read(10,*), r_tumorDimensional
	read(10,*), xTumorDimensional
	read(10,*), yTumorDimensional	 
	read(10,*), zTumorDimensional
	close (10)
	if (rho_dimensional.eq.0.0d0) then
		!----------------------Dimensionless time without proliferation-------------
		t_adim = (D_dimensional/DomainX_Dimensional**2.0d0)*t_dimensional  
		Num_it = idint(t_adim/dt)
		print*, '-------------', Num_it, 'iterations are equal to', t_dimensional, 'hour                -----------------'
		print*, '-----------------------------MRI-like data printing every', Iter_time, 'hours -------------------------------------' 
		Print*, '-------------------------------TUMOR GROWTH WITHOUT CELL PROLIFERATION-------------------------------------------'
	else 
		!----------------------Dimensionless time with proliferation-------------
		t_adim=rho_dimensional*t_dimensional	
		Num_it = idint(t_adim/dt)
		print*, '-------------', Num_it, 'iterations are equal to', t_dimensional, 'day                 -----------------'
		print*, '----------------------------- MRI-like data printing every', Iter_time, 'days -------------------------------------' 
		Print*, '--------------------------------TUMOR GROWTH WITH CELL PROLIFERATION---------------------------------------------'
	end if 

end subroutine
!-----------------------------------------------------------------------------------------
	
