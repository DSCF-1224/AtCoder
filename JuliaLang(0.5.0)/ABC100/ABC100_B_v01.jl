# AtCoder Beginner Contest 100 B
# [URL]      https://atcoder.jp/contests/abc100/tasks/abc100_b
# [compiler] Version 0.5.0

#==================================================================================================#

function abc100_b()

	# STEP.01
	# get the number of the slice of cake
	D, N = Base.parse.( Base.split( Base.readline( Base.STDIN ) ) )

	if Base.isequal( N, 100 )
		num_presents = 101*100^D
	else
		num_presents = N*100^D
	end

	# STEP.02
	Base.println( Base.STDOUT, num_presents )

	# STEP.TRUE_END
	return Base.nothing

end

#==================================================================================================#

Main.abc100_b()
