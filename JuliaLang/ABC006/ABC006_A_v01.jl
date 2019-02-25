# AtCoder Beginner Contest 069 B
# [URL]      https://atcoder.jp/contests/abc069/tasks/abc069_b
# [compiler] Version 0.5.0

#===================================================================================#

function get_data_from_stdin()
	return Base.parse( Base.readline( Base.STDIN ) )
end

function abc006_a()

	# STEP.01
	# get the target number
	n = get_data_from_stdin()

	# STEP.02
	# output the result
	if Base.isequal( Base.rem(n, 3), 0 )
		Base.println( Base.STDOUT, "YES" )
	else
		Base.println( Base.STDOUT, "NO" )
	end

	# STEP.TRUE_END
	return Base.nothing

end

#===================================================================================#

Main.abc006_a()
