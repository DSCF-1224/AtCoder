! AtCoder Beginner Contest 069 B
! [URL]      https://atcoder.jp/contests/abc069/tasks/abc069_b
! [compiler] fortran (gfortran v4.8.4)
! [reference]
! 
module ABC069

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public :: ABC069_B


	! constants for this <module>
	integer( kind=INT32 ), parameter, private :: len_TargetWord_max = 100


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC069_B

		! variables for this <subroutine>
		character( len=len_TargetWord_max, kind=1 ) :: word_input

		integer( kind=INT16 ) :: len_word

		! STEP.01
		! read out the target word
		read( unit=INPUT_UNIT, fmt='(A)' ) word_input

		! STEP.02
		! get the length of the target word
		len_word = len_trim( word_input )

		! STEP.03
		! output the result
		write( unit=OUTPUT_UNIT, fmt='(A1,I0,A1)', advance='yes' ) word_input(1:1), len_word-2, word_input(len_word:len_word)

		! STEP.END
		return

	end subroutine ABC069_B

end module ABC069


program main

	! <module>s to import
	use, non_intrinsic :: ABC069

	! require all variables to be explicitly declared
	implicit none

	call ABC069_B

end program main
