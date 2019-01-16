!------------------- Saves data of different ZX planes around the tumor ------------------
subroutine save2Dzx(first_index, jp)  
	use parameters
  	implicit none

	character(len=20) filestatus
	logical firstcall
	data firstcall / .true. /
	save firstcall


	character(len=256) :: filename

	integer i,j,h,first_index, jp


  	if (first_index.eq.0) then
    		filestatus = 'replace'
  	else
     		filestatus = 'old'
  	end if

	! --------------------------   Saving data   ------------------------------

  	if (filestatus=='replace') then
     		open(1,file=file_name2Dzx,form='formatted',status=filestatus)
  	else
     		open(1,file=file_name2Dzx,form='formatted',status=filestatus,position='append')
  	end if
  	write(1,*) ''
  	write(1,*) '#Time = ',t


	do i=0,Nx
  		write(1,*)
    		do h=0,Nz
     			write(1,*) ( FactorDimension_long * x(i,0,h)), ( FactorDimension_long *z(i,0,h)), D(i,jp-28,h), phi(i, jp-28, h), &
     			D(i,jp-18,h), phi(i,jp-18,h), D(i,jp-8,h), phi(i,jp-8,h), D(i,jp-3,h), phi(i,jp-3,h), D(i,jp-1,h), phi(i,jp-1,h), &
     			D(i,jp,h), phi(i,jp,h), &
     			D(i,jp+1,h), phi(i,jp+1,h), D(i,jp+3,h), phi(i,jp+3,h), D(i,jp+8,h), phi(i,jp+8,h), D(i,jp+18,h), phi(i,jp+18,h), &
     			D(i,jp+28,h), phi(i,jp+28,h)
				
    		end do
  	end do
  
  	write(1,*)
  	close(1)

end subroutine save2Dzx


