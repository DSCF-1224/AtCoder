! AtCoder Beginner Contest 001 D
! [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_4
! [compiler] fortran (gfortran v4.8.4)
! 
program main

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	! require all variables to be explicitly declared
	implicit none

	integer( kind=INT32 )      :: num_records
	character( len=9, kind=1 ) :: data_str

	integer( kind=INT32 ), allocatable :: time_start(:), time_end(:)

	integer( kind=INT32 ) :: itr

	! STEP.01
	! read out the number of the records
	read *, num_records

	! STEP.02
	! allocate the arrays to store the read data
	allocate( time_start(1:num_records) )
	allocate( time_end  (1:num_records) )

	! STEP.03
	! read out the data of rainy time
	do itr = 1, num_records, 1

		! STEP.03.01
		! read out the data as a string
		read  *, data_str

		! STEP.03.02
		! convert the data of string to integer
		read( unit=data_str(1:4), fmt='(I4)' ) time_start(itr)
		read( unit=data_str(6:9), fmt='(I4)' ) time_end  (itr)
		print '(I4,1X,I4)', time_start(itr), time_end(itr)

	end do

	! STEP.04
	! allocate the arrays to store the read data
	deallocate( time_start )
	deallocate( time_end   )

end program
