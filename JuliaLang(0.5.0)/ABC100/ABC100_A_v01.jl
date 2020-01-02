# AtCoder Beginner Contest 100 A
# [URL]      https://atcoder.jp/contests/abc100/tasks/abc100_a
# [compiler] Version 0.5.0

#==================================================================================================#

function abc100_a()

	# STEP.01
	# get the number of the slice of cake
	A, B = Base.parse.( Base.split( Base.readline( Base.STDIN ) ) )

	# STEP.02
	# output the result
	if A <= 8 && B <= 8
		Base.println( Base.STDOUT, "Yay!")
	else
		Base.println( Base.STDOUT, ":(" )
	end

	# STEP.TRUE_END
	return Base.nothing

end

#==================================================================================================#

Main.abc100_a()
