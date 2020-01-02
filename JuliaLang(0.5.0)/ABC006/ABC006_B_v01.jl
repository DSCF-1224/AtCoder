# AtCoder Beginner Contest 069 B
# [URL]      https://atcoder.jp/contests/abc069/tasks/abc069_b
# [compiler] Version 0.5.0

#===================================================================================#

# constants for this <program>
const DIVISOR        = Base.convert( Base.Int64, 10007 )
const TERM_MAX       = Base.convert( Base.Int64,  10^6 )
const TRIBONACCI_1st = Base.convert( Base.Int64,     0 )
const TRIBONACCI_2nd = Base.convert( Base.Int64,     0 )
const TRIBONACCI_3rd = Base.convert( Base.Int64,     1 )


function get_data_from_stdin()
	return Base.parse( Base.readline( Base.STDIN ) )
end

function calc_mod_tribonacci( term::Base.Int64 )

	# STEP.01
	# prepare the buffer of tribonacci sequence
	buf = Base.zeros( Base.Int64, TERM_MAX )

	# STEP.02
	# set the initial values
	buf[1] = TRIBONACCI_1st
	buf[2] = TRIBONACCI_2nd
	buf[3] = TRIBONACCI_3rd

	# STEP.03
	# calcualte the target term of the tribonacci sequence
	if term <= 3
		return buf[term]
	else

		for itr in 4:1:term
			buf[itr] = +( Base.rem( buf[itr-1], DIVISOR ), Base.rem( buf[itr-2], DIVISOR ), Base.rem( buf[itr-3], DIVISOR ) )
		end

		return Base.rem( buf[term], DIVISOR )

	end

end

function abc006_a()

	# STEP.01
	# get the target number
	n = get_data_from_stdin()

	# STEP.02
	# output the result
	Base.println( Base.STDOUT, calc_mod_tribonacci(n) )

	# STEP.TRUE_END
	return Base.nothing

end

#===================================================================================#

Main.abc006_a()
