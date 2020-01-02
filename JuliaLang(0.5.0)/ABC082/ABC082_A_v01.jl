# AtCoder Beginner Contest 082 A
# [URL]      https://atcoder.jp/contests/abc082/tasks/abc082_a
# [compiler] Version 0.5.0

#==================================================================================================#

function get_data_from_stdin()
	return Base.parse.( Base.split( Base.readline( Base.STDIN ) ) )
end

function abc082_a()

	# STEP.01
	# get the target positive numbers
	a, b = get_data_from_stdin()

	# STEP.02
	# output the result
	Base.println( Base.STDOUT, Base.div(a+b, 2)+Base.rem(a+b, 2) )

	# STEP.TRUE_END
	return Base.nothing

end

#==================================================================================================#

Main.abc082_a()
