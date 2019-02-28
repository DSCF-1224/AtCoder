! AtCoder Beginner Contest 003 B
! [URL]      https://atcoder.jp/contests/abc003/tasks/abc003_2
! [compiler] fortran (gfortran v4.8.4)
! 
module ABC003

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	! require all variables to be explicitly declared
	implicit none

	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: abc003_B
	private :: judge_exchangeable
	private :: judge_targets

	! constants for this <module>
	character(len=11, kind=1), parameter, private :: phrase_win  = 'You can win'
	character(len=13, kind=1), parameter, private :: phrase_lose = 'You will lose'

	integer( kind=INT32 ), parameter, private :: len_word_max = 10


	! contained <subroutine>s and <function>s are below
	contains


	! Main Process
	subroutine abc003_B

		! variables for this <subroutine>
		character(len=len_word_max, kind=1) :: buf_word_1, buf_word_2


		! STEP.01
		! read out the target two words
		read( unit=INPUT_UNIT, fmt='(A)' ) buf_word_1
		read( unit=INPUT_UNIT, fmt='(A)' ) buf_word_2

		! STEP.END
		if ( judge_targets( buf_word_1, buf_word_2, len_trim( buf_word_1, kind=INT8 ) ) ) then
			write( unit=OUTPUT_UNIT, fmt='(A)', advance='yes' ) phrase_win; return
		else
			write( unit=OUTPUT_UNIT, fmt='(A)', advance='yes' ) phrase_lose; return
		end if

	end subroutine abc003_B

	! judge whether the target character is one of the exchangeable one
	pure function judge_exchangeable( target ) result( stat )

		! arguments for this ⟨function⟩
		character(len=1, kind=1), intent(in) :: target

		! return value of this ⟨function⟩
		logical :: stat

		! variables for this ⟨function⟩
		integer( kind=INT32 ) :: code_target

		! STEP.01
		! store the ASCII code of the `target`
		code_target = iachar(target)

		! STEP.02
		! judge whether the target character is one of the exchangeable one
		if     ( code_target .eq. iachar('a') ) then; stat = .true.; return
		elseif ( code_target .eq. iachar('t') ) then; stat = .true.; return
		elseif ( code_target .eq. iachar('c') ) then; stat = .true.; return
		elseif ( code_target .eq. iachar('o') ) then; stat = .true.; return
		elseif ( code_target .eq. iachar('d') ) then; stat = .true.; return
		elseif ( code_target .eq. iachar('e') ) then; stat = .true.; return
		elseif ( code_target .eq. iachar('r') ) then; stat = .true.; return
		else
			stat = .false.; return
		end if

	end function judge_exchangeable

	! judge the target two words
	! win  -> .true.
	! lose -> .false.
	pure function judge_targets( str1, str2, len ) result( stat )

		! arguments for this ⟨function⟩
		character(len=*, kind=1), intent(in) :: str1, str2
		integer( kind=INT8 ),     intent(in) :: len

		! return value of this ⟨function⟩
		logical :: stat

		! support variables for this ⟨function⟩
		integer( kind=INT8 ) :: itr

		do itr = 1,len,1
			if ( iachar( str1(itr:itr) ) .eq. iachar( str2(itr:itr) ) ) then
				continue
			else
				if ( &!
					( iachar( str1(itr:itr) ) .eq. iachar( '@' ) .and. judge_exchangeable( str2(itr:itr) ) ) .or. &!
					( iachar( str2(itr:itr) ) .eq. iachar( '@' ) .and. judge_exchangeable( str1(itr:itr) ) )      &!
				) then
					continue
				else
					! STEP.BAD_END
					stat = .false.; return
				end if
			end if
		end do

		! STEP.TRUE_END
		stat = .true.; return

	end function judge_targets

end module ABC003

program main

	! <module>s to import
	use, non_intrinsic :: abc003

	! require all variables to be explicitly declared
	implicit none

	! call main process
	call abc003_B

end program main
