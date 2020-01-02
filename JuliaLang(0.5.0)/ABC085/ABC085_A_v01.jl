# AtCoder Beginner Contest 085 A
# [URL]      https://atcoder.jp/contests/abc085/tasks/abc085_a
# [compiler] Version 0.5.0

#==================================================================================================#

function abc085_a()

	# STEP.01
	# get the target date
	str_data_input = Base.readline( Base.STDIN )

	# STEP.02
	# output the result
	Base.println( Base.STDOUT, "2018" * str_data_input[5:end] )

	# STEP.TRUE_END
	return Base.nothing

end

#==================================================================================================#

Main.abc085_a()
