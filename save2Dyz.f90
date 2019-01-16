!------------------------Saves data of different YZ planes around the tumor------------------------
subroutine save2Dyz(first_index, ip)
	use parameters
  	implicit none

	character(len=20) filestatus
	logical firstcall
	data firstcall / .true. /
	save firstcall


	character(len=256) :: filename

	integer i,j,h,first_index, ip


  	if (first_index.eq.0) then
    		filestatus = 'replace'
  	else
     		filestatus = 'old'
  	end if



	! ---------------------------   Saving data   ------------------------------------------

  	if (filestatus=='replace') then
	     	open(1,file=file_name2Dyz,form='formatted',status=filestatus)
  	else
	     	open(1,file=file_name2Dyz,form='formatted',status=filestatus,position='append')
  	end if
  	write(1,*) ''
  	write(1,*) '#Time = ',t


	do j=0,Ny
  		write(1,*)
    		do h=0,Nz
     			write(1,*) ( FactorDimension_long * y(0,j,h)), ( FactorDimension_long *z(0,j,h)), D(ip-28,j,h), phi(ip-28,j,h), &
     			D(ip-18,j,h), phi(ip-18,j,h), D(ip-8,j,h), phi(ip-8,j,h), D(ip-3,j,h), phi(ip-3,j,h), D(ip-1,j,h), phi(ip-1,j,h), &
     			D(ip,j,h), phi(ip,j,h), &
     			D(ip+1,j,h), phi(ip+1,j,h), D(ip+3,j,h), phi(ip+3,j,h), D(ip+8,j,h), phi(ip+8,j,h), D(ip+18,j,h), phi(ip+18,j,h), &
     			D(ip+28,j,h), phi(ip+28,j,h)			
    		end do
  	end do
  
  	write(1,*)
  	close(1)

end subroutine save2Dyz


