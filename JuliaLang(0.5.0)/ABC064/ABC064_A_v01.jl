# AtCoder Beginner Contest 064 A
# [URL]      https://atcoder.jp/contests/abc064/tasks/abc064_a
# [compiler] Version 0.5.0

#==================================================================================================#

function abc064_a()

	# STEP.01
	# get the number of the slice of cake
	r,g,b = Base.parse.( Base.split( Base.readline( Base.STDIN ) ) )

	# STEP.02
	# output the result
	if Base.isequal( Base.rem( 10*(10*r+g)+b, 4 ), 0 )
		Base.println( Base.STDOUT, "YES" )
	else
		Base.println( Base.STDOUT, "NO" )
	end

	# STEP.TRUE_END
	return Base.nothing

end

#==================================================================================================#

Main.abc064_a()
