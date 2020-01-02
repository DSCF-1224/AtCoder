# AtCoder Beginner Contest 088 A
# [URL]      https://atcoder.jp/contests/abc088/tasks/abc088_a
# [compiler] Version 0.5.0

#==================================================================================================#

function get_data_from_stdin()
	return Base.parse( Base.readline( Base.STDIN ) )
end

function abc088_a()

	# STEP.01
	# get the target data
	N = get_data_from_stdin()
	A = get_data_from_stdin()

	# STEP.02
	# output the result
	if Base.rem( N, 500 ) <= A
		Base.println( Base.STDOUT, "Yes" )
	else
		Base.println( Base.STDOUT, "No" )
	end

	# STEP.TRUE_END
	return Base.nothing

end

#==================================================================================================#

Main.abc088_a()
