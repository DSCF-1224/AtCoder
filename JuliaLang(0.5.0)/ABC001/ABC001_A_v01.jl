# AtCoder Beginner Contest 001 A
# [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_1
# [compiler] Version 0.5.0

#==================================================================================================#

function abc001_A()

	# STEP.01
	# get the values of height of snow
	buf_readline = Base.readline( Base.STDIN, keep=Bool=false )
	H_1, H_2     = Base.split( buf_readline, " " )

	# STEP.02
	# calculate and output the change of the height of snow
	Base.println( Base.STDOUT, H_1 - H_2 )

	return Core.nothing

end

#==================================================================================================#

Main.abc001_A()
