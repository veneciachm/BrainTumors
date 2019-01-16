!-----------------------------------------------------------------------------------------
!-------------------------*************************************---------------------------
!-------------------------***                               ***---------------------------
!-------------------------***    3D BRAIN TUMOR EVOLUTION   ***---------------------------
!-------------------------***      Finite Differences       ***---------------------------
!-------------------------***             RKÂ3              ***---------------------------
!-------------------------***       Venecia Chavez          ***---------------------------
!-------------------------***            2017               ***---------------------------
!-------------------------***                               ***---------------------------
!-------------------------*************************************---------------------------
!-----------------------------------------------------------------------------------------
program main
	use parameters
	implicit none
	integer i,j,k,l, h
	
	integer ip, jp, hp ! Represent the original position of the tumor 
	
	real one, zero, half, two
	real (kind=8) dt_temp
	real (kind=8), allocatable, dimension (:,:,:) :: rhs_phi

	call read_parameters()
	
	allocate(x(0:Nx,0:Ny, 0:Nz), y(0:Nx,0:Ny, 0:Nz), z(0:Nx,0:Ny, 0:Nz))
  	allocate(phi(0:Nx,0:Ny, 0:Nz),phi_p(0:Nx,0:Ny, 0:Nz) )
	allocate(rhs_phi(0:Nx,0:Ny, 0:Nz))
	allocate(D(0:Nx,0:Ny, 0:Nz))	

	t = 0.0D0
	

	one=1.0d0
	zero=0.0d0
	half=0.50d0
	two=2.0d0
	t = 0.0D0
	
	call grid_lengths()       	
	call discret_domain()  
	
	Print*, '-----------------------------------------------------------------------------------------------------------------'
	Print*, '-------------THE FOLLOWINGNUMBERS MUST BE EQUAL ON THE GRID, FOLLOWIIN THE VALUES OF THE MRI---------------------'
	Print*, '--------------------------------    dx =', dx, '----------------------------------------------'
	Print*, '--------------------------------    dy =', dy, '----------------------------------------------'
	Print*, '--------------------------------    dz =', dz, '----------------------------------------------'
	Print*, '-----------------------------------------------------------------------------------------------------------------'
	
	call define_D()

	!----------------------------------- INITIAL POPULATION---------------------------------------
	!------------------------- ORIGINAL SIZE AND SHAPE OF THE BRAIN TUMOR ------------------------
	do h=0, Nz
		do j=0, Ny
			do i=0, Nx
				!----------------------CANCER CELLS POPULATION-----------------------
				if( ( (x(i,j,h)-xTumorAdim)**2.0d0 + (y(i,j,h)-yTumorAdim)**2.0d0 + (z(i,j,h)-zTumorAdim)**2.0d0) .le. (r_tumorAdim)**2) then
					phi(i,j,h)  = 0.07663106 
					ip=i 
					jp=j
					hp=h
				else 
					phi(i,j,h)  = 0.0d0
				end if
			end do 
		end do
	end do
	
	
	call dimensionless_time() 				
	call save2Dxy(0, hp)		
	call save2Dyz(0, ip)
	call save2Dzx(0, jp)
	
	
	!-------------------------------------------------------------------------------------
	print *,'----------------------------'
	print *,'|  Time step  |    Time    |'
	print *,'----------------------------'
	
	write(*,"(A5,I6,A6,ES9.2,A3)") ' |   ',0,'    | ',t,'  |'
	!-------------------------------------------------------------------------------------
	
	!-------------------------------TIME EVOLUTION----------------------------------------
	do l=1,Nt
		t = t + dt
		
		!----------------- -EXPLICIT SOLVER: RUNGE KUTTA 3RD ORDER -------------------
		!-----------------------------------------------------------------------------
		phi_p = phi
       		do k=1,3
			do h = 2, Nz-2
				do j=2, Ny-2
					do i=2, Nx-2
						rhs_phi(i,j,h)=  D(i,j,h) * &
			 				( ((-1.0d0*phi(i-2,j,h)+16.0d0*phi(i-1,j,h)-30.0d0*phi(i,j,h)+16.0d0*phi(i+1,j,h)-1.0d0*phi(i+2,j,h)) / &
							(12.0d0*dx**2)) + &
				
							((-1.0d0*phi(i,j-2,h)+16.0d0*phi(i,j-1,h)-30.0d0*phi(i,j,h)+16.0d0*phi(i,j+1,h)-1.0d0*phi(i,j+2,h)) / &
							(12.0d0*dy**2)) + &
				
							((-1.0d0*phi(i,j,h-2)+16.0d0*phi(i,j,h-1)-30.0d0*phi(i,j,h)+16.0d0*phi(i,j,h+1)-1.0d0*phi(i,j,h+2))  /  &
							(12.0d0*dz**2)) )	+ &
				
				
							( ((phi(i-2,j,h)-8.0d0*phi(i-1,j,h)+8.0d0*phi(i+1,j,h)-1.0d0*phi(i+2,j,h))* &
							(D(i-2,j,h)-8.0d0*D(i-1,j,h)+8.0d0*D(i+1,j,h)-1.0d0*D(i+2,j,h)))/(12.0d0*dx) + &
				
							((phi(i,j-2,h)-8.0d0*phi(i,j-1,h)+8.0d0*phi(i,j+1,h)-1.0d0*phi(i,j+2,h))* &
							(D(i,j-2,h)-8.0d0*D(i,j-1,h)+8.0d0*D(i,j+1,h)-1.0d0*D(i,j+2,h)))/(12.0d0*dy) + &
				
							((phi(i,j,h-2)-8.0d0*phi(i,j,h-1)+8.0d0*phi(i,j,h+1)-1.0d0*phi(i,j,h+2))* &
							(D(i,j,h-2)-8.0d0*D(i,j,h-1)+8.0d0*D(i,j,h+1)-1.0d0*D(i,j,h+2)))/(12.0d0*dz) ) + &
				
							rho*phi(i,j,h)*(1.0d0-(phi(i,j,h)/kp)) 
					end do 
				end do 
			end do 


         		!----------------------------  RK3 --------------------------------
         		if (k.eq.1) then
         			dt_temp = dt
          			phi = phi_p + dt_temp*rhs_phi
        		else if (k.eq.2) then
           			dt_temp = 0.25*dt
           			phi = 0.75*phi_p + 0.25*phi + dt_temp*rhs_phi
        		else
           			dt_temp = 2.0D0*dt/3.0D0
           			phi = phi_p/3.0D0 + 2.0D0*phi/3.0D0 + dt_temp*rhs_phi
         		end if

			!------------------------BOUNDARY CONDITIONS ---------------------
         		phi(0,:,:)  = phi(1,:,:)
         		phi(Nx,:,:) = phi(Nx-1,:,:)
         		phi(:,0,:)  = phi(:,1,:)
         		phi(:,Ny,:) = phi(:,Ny-1,:)
			phi(:,:,0)  = phi(:,:,1)
			phi(:,:,Nz) = phi(:,:,Nz-1)
						
			do h=0, Nz
				do j=0, Ny
					do i=0, Nx 
						phi(i,j,h)= max( 10e-11, phi(i,j,h) )
					end do 
				end do 
			end do
         	end do
       	
        	!--------------------------------------------------------------------------------------------- 
		if ( (mod(l, (Num_it)) .eq. 0) ) then 	
			if ( (mod(l, (Num_it*Iter_time)) .eq. 0) ) then
				call save2Dxy(1, hp)
				call save2Dyz(1, ip)
				call save2Dzx(1, jp)
			end if 
 			write(*,"(A5,I6,A6,ES9.2,A3)") ' |   ',l,'    | ',t,'  |'
		end if
		if (l.ge.Nt) then
			print *, 'Finished at t=',t
		    	!exit
		end if
		!----------------------------------------------------------------------------------------------
	end do

end program main
