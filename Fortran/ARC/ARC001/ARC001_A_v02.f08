! AtCoder Regular Contest 001 A
! [URL]      https://atcoder.jp/contests/arc001/tasks/arc001_1
! [compiler] fortran (gfortran v4.8.4)
! 
module ARC001

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	! require all variables to be explicitly declared
	implicit none


	! parameters for this <module>
	integer( kind= INT32 ), parameter :: num_problems_max = 100
	integer( kind= INT32 ), parameter :: num_choices      =   4


	! contained <subroutine>s and <function>s are below
	contains

	subroutine ARC001_A

		! variables for this <subroutine>
		integer( kind= INT32 ) :: num_problems
		integer( kind= INT32 ) :: val_CorrectAnswer( 1:num_problems_max )
		integer( kind= INT32 ) :: num_CorrectAnswer( 1:num_choices )

		character( len= num_problems_max, kind= 1 ) :: str_CorrectAnswer

		! support variables for this <subroutine>
		integer( kind= INT32 ) :: itr_prob, itr_choice

		! STEP.01
		! read out the number of the problems
		read *, num_problems

		! STEP.02
		! read out the number
		read *, str_CorrectAnswer

		! STEP.03
		! convert the string of the correct answers to integers

			! STEP.03.01
			! initialize the array to store the values of correct answers
			val_CorrectAnswer(:) = 0

			! STEP.03.02
			! conversion
			do itr_prob = 1, num_problems, 1
				read ( str_CorrectAnswer( itr_prob:itr_prob ), * ) val_CorrectAnswer( itr_prob )
			end do

		! STEP.04
		! count up the number of the correct answers
		do itr_choice = 1, num_choices, 1
			num_CorrectAnswer( itr_choice ) = sum( val_CorrectAnswer( 1:num_problems ), dim= 1, mask= val_CorrectAnswer .eq. itr_choice )
			num_CorrectAnswer( itr_choice ) = num_CorrectAnswer( itr_choice ) / itr_choice
		end do

		! STEP.04
		! output the result
		print '(I0,1X,I0)', maxval( num_CorrectAnswer(:), dim=1 ), minval( num_CorrectAnswer(:), dim=1 )

		! STEP.TRUE_END
		return

	end subroutine ARC001_A

end module ARC001

program main

	! <module>s to import
	use, non_intrinsic :: ARC001

	! require all variables to be explicitly declared
	implicit none

	call ARC001_A

end program main
