# AtCoder Beginner Contest 081 A
# [URL]      https://atcoder.jp/contests/abc081/tasks/abc081_a
# [compiler] Version 0.5.0
# [reference]
# <1> https://atcoder.jp/contests/abc081/submissions/3181551

#==================================================================================================#
function isTargetNum( char, target )
	return Base.ifelse( Base.isequal(char, target), 1, 0 )
end

function abc081_a()

	# STEP.01
	# get the target positive numbers
	buffer = Base.readline( Base.STDIN )

	# STEP.02
	# count up the target letter
	count  = Base.zero( Core.Int16 )
	count += Main.isTargetNum( buffer[1], '1' )
	count += Main.isTargetNum( buffer[2], '1' )
	count += Main.isTargetNum( buffer[3], '1' )

	# STEP.03
	# output the result
	Base.println( Base.STDOUT, count )

	# STEP.TRUE_END
	return Base.nothing

end

#==================================================================================================#

Main.abc081_a()
