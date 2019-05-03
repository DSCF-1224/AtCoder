! AtCoder Beginner Contest 006 C
! [URL]      https://atcoder.jp/contests/abc006/tasks/abc006_3
! [compiler] fortran (gfortran v4.8.4)
! [reference]
! 
module ABC006

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: ABC006_C
	private :: find_structure
	private :: calc_num_legs_total
	private :: write_structure


	! constants for this <module>
	integer( kind=INT32 ), parameter, private :: num_legs_adult  = +2
	integer( kind=INT32 ), parameter, private :: num_legs_senior = +3
	integer( kind=INT32 ), parameter, private :: num_legs_baby   = +4
	integer( kind=INT32 ), parameter, private :: val_error       = -1


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC006_C

		! variables for this <subroutine>
		integer( kind=INT32 ) :: population
		integer( kind=INT32 ) :: num_legs_total

		! STEP.01
		! read out the target integers
		read( unit=INPUT_UNIT, fmt=* ) population, num_legs_total

		! STEP.02
		! search and output the result
		call find_structure( population, num_legs_total )

		! STEP.END
		return

	end subroutine ABC006_C


	subroutine find_structure( population, num_legs_total )

		! arguments for this <subroutine>
		integer( kind=INT32 ), intent(in) :: population
		integer( kind=INT32 ), intent(in) :: num_legs_total

		! support variables for this <subroutine>
		integer( kind=INT32 ) :: itr_adult, itr_senior, itr_baby

		! STEP.01
		! iterate the population of the adults and seniors
		do itr_senior = 0, 1, 1
		do itr_adult  = 0, population-itr_senior, 1
			
			! STEP.02
			! determine the population of the babies
			itr_baby = population - (itr_adult+itr_senior)

			! STEP.03
			! judge the current structure is one of the possible structure
			if( &!
				itr_baby .ge. 0 .and. &!
				calc_num_legs_total( itr_adult, itr_senior, itr_baby ) .eq. num_legs_total &!
			) then

				! STEP.TRUE_END
				call write_structure( itr_adult, itr_senior, itr_baby )
				return

			end if

		end do
		end do

		! STEP.BAD_END
		call write_structure( val_error, val_error, val_error )
		return

	end subroutine find_structure


	function calc_num_legs_total( num_adults, num_seniors, num_babies ) result( num_legs_total )

		! arguments for this <function>
		integer( kind=INT32 ), intent(in) :: num_adults, num_seniors, num_babies

		! return value of this <function>
		integer( kind=INT32 ) :: num_legs_total

		! STEP.01
		num_legs_total &!
		= num_legs_adult  * num_adults  &!
		+ num_legs_senior * num_seniors &!
		+ num_legs_baby   * num_babies

		! STEP.END
		return

	end function calc_num_legs_total


	subroutine write_structure( num_adults, num_seniors, num_babies )

		! arguments for this <subroutine>
		integer( kind=INT32 ), intent(in) :: num_adults, num_seniors, num_babies

		! STEP.01
		write( unit=OUTPUT_UNIT, fmt='(I0,2(1X,I0))', advance='yes' ) num_adults, num_seniors, num_babies

		! STEP.END
		return

	end subroutine write_structure

end module ABC006


program main

	! <module>s to import
	use, non_intrinsic :: ABC006

	! require all variables to be explicitly declared
	implicit none

	call ABC006_C

end program main
