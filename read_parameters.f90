!-----------------------------------------------------------------------------------------
subroutine read_parameters()
	use parameters
	implicit none
	open(10, file='input.par')
	
	read(10,*), coefficient	
	read(10,*), iter_time

	read(10,*), xmax
	read(10,*), xmin
	read(10,*), Nx
	read(10,*), ymax
	read(10,*), ymin
	read(10,*), Ny
	read(10,*), zmax
	read(10,*), zmin
	read(10,*), Nz
	
	read(10,*), Nt
	read(10,*), courant


	read(10,*), Dg
	read(10,*), Dw
	read(10,*), rho  
	read(10,*), kp

	read(10,*),  file_name2Dxy
	read(10,*),  file_name2Dyz
	read(10,*),  file_name2Dzx

	close(10)
end subroutine
!-----------------------------------------------------------------------------------------
