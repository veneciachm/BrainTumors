!-----------------------------------------------------------------------------------------
subroutine discret_domain() 
	use parameters
	implicit none
	integer i, j, h
	!---------Specification of the domain of the independet variable ----------------
	!------------------------ VALUES FOLLOWING THE MRI -----------------------------------
	!--------------------------- Hence, dx = dy = dz ------------------------------------
	dx=(xmax-xmin)/dble(Nx)
	dy=(ymax-ymin)/dble(Ny)
	dz=(zmax-zmin)/dble(Nz)   

	do i=0, Nx
		do j=0, Ny
			do h=0, Nz
				x(i,j, h)=xmin+dx*dble(i)
				y(i,j, h)=ymin+dy*dble(j)
				z(i,j, h)=zmin+dz*dble(h)
			end do 
		end do
	end do
	dt = courant*dx**2.0d0

end subroutine
!-----------------------------------------------------------------------------------------
