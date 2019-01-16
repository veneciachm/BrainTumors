!-----------------------------------------------------------------------------------------
subroutine define_D()
	use parameters
	implicit none
	integer i, j,h
	integer c
	
	integer, allocatable, dimension (:) :: D_temp

	!--------------------- Simulating an InVitro experiment--------------------------
	if (coefficient.eq.1) then      
		do i=0, Nx
			do j=0, Ny
				do h=0, Nz	
					if(h .gt. Nz/2) then
						D(i,j,h)=Dw
					else 
						D(i,j,h)=Dg
					end if
				end do
			end do
		end do
	
	!--------------------------- Following the MRI data ----------------------------
	else if (coefficient.eq.2) then	
		allocate ( D_temp( 1:(Nx+1)*(Ny+1)*(Nz+1) ) )
		open(10, file='BrainGW')

		do c=1, ( (Nx+1)*(Ny+1)*(Nz+1) )
			read(10,*), D_temp (c)
		end do 		

		c=1
		do h=0, Nz
			do j=0, Ny
				do i=0, Nx
					if (D_temp (c) .eq. 2) then
						D(i,j,h) = Dg
					else if  (D_temp (c) .eq. 1) then
						D(i,j,h) = Dw
					else
						D(i,j,h) = 10e-12    
					end if 
					c = c+1
				end do 
			end do
		end do
	
		close(10)
	end if
end subroutine
!-----------------------------------------------------------------------------------------
