# [contests]   ABC 006
# [task]       A  
# [URL]        https://atcoder.jp/contests/abc006/tasks/abc006_1
# [compiler]   Julia (0.5.0)
# [submission] https://atcoder.jp/contests/abc006/submissions/4381280 : AC

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
