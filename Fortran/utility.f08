module utility

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! contained <subroutine>s and <function>s are below
    contains

    pure elemental function is_odd (i)

        ! argument(s) for this <function>
        integer(INT32) , intent(in) :: i

        ! return value of this <function>
        logical :: is_odd

        is_odd = btest(i= i, pos= 0)

    end function

    pure elemental function is_even (i)

        ! argument(s) for this <function>
        integer(INT32) , intent(in) :: i

        ! return value of this <function>
        logical :: is_even

        is_even = .not. is_odd(i)

    end function is_even

    pure elemental function reverse_string (string) result(reversed)

        ! argument(s) for this <function>
        character(len=*) , intent(in) :: string

        ! return value of this <function>
        character(len= len_trim(string)) :: reversed

        ! variable(s) for this <function>
        character(len=1) :: buffer( len(reversed) )

        ! STEP.01
        ! Assign the target string to the buffer.
        buffer(:) = transfer( source= trim(string), mold= buffer(:) )

        ! STEP.04
        ! Reverse the target string.
        reversed = transfer( source= buffer(len(reversed):1:-1), mold= reversed )

    end function reverse_string

end module utility
