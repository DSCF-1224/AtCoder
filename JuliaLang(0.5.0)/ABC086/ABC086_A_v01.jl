# AtCoder Beginner Contest 086 A
# [URL]      https://atcoder.jp/contests/abc086/tasks/abc086_a
# [compiler] Version 0.5.0

#==================================================================================================#

function abc086_a()

	# STEP.01
	# get the target positive numbers
	a,b = Base.parse.( Base.split( Base.readline( Base.STDIN ) ) )

	# STEP.02
	# output the result
	if Base.iseven( a*b )
		Base.println( Base.STDOUT, "Even")
	else
		Base.println( Base.STDOUT, "Odd" )
	end

	# STEP.TRUE_END
	return Base.nothing

end

#==================================================================================================#

Main.abc086_a()
