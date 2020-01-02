# AtCoder Beginner Contest 069 B
# [URL]      https://atcoder.jp/contests/abc069/tasks/abc069_b
# [compiler] Version 0.5.0

#===================================================================================#

function abc069_b()

	# STEP.01
	# get the target date
	word = Base.chomp( Base.readline( Base.STDIN ) )

	# STEP.02
	# output the result
	Base.println( Base.STDOUT, word[1:1],Base.length( word )-2,word[end:end] )

	# STEP.TRUE_END
	return Base.nothing

end

#===================================================================================#

Main.abc069_b()
