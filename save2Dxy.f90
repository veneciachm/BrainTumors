!--------------------- Saves data of different XY planes around the tumor ---------------------------
subroutine save2Dxy(first_index, hp) 
	use parameters
  	implicit none

	character(len=20) filestatus
	logical firstcall
	data firstcall / .true. /
	save firstcall


	character(len=256) :: filename

	integer i,j,h,first_index, hp


  	if (first_index.eq.0) then
    	filestatus = 'replace'
  	else
     	filestatus = 'old'
  	end if



	! ---------------------------   Saving data   ----------------------

  	if (filestatus=='replace') then
	     	open(1,file=file_name2Dxy,form='formatted',status=filestatus)
  	else
     		open(1,file=file_name2Dxy,form='formatted',status=filestatus,position='append')
  	end if
  	write(1,*) ''
  	write(1,*) '#Time = ',t


	do i=0,Nx
  		write(1,*)
    		do j=0,Ny
     			write(1,*) ( FactorDimension_long * x(i,j,0)), ( FactorDimension_long *y(i,j,0)), D(i,j,hp-28), phi(i,j,hp-28), &
     			D(i,j,hp-18), phi(i,j,hp-18), D(i,j,hp-8), phi(i,j,hp-8), D(i,j,hp-3), phi(i,j,hp-3), D(i,j,hp-1), phi(i,j,hp-1), &
     			D(i,j,hp), phi(i,j,hp), &
     			D(i,j,hp+1), phi(i,j,hp+1), D(i,j,hp+3), phi(i,j,hp+3), D(i,j,hp+8), phi(i,j,hp+8), D(i,j,hp+18), phi(i,j,hp+18), &
     			D(i,j,hp+28), phi(i,j,hp+28)
				
    		end do
  	end do
  
  	write(1,*)
  	close(1)

end subroutine save2Dxy


