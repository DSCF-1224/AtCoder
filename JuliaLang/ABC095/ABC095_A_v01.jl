# AtCoder Beginner Contest 095 A
# [URL]      https://atcoder.jp/contests/abc095/tasks/abc095_a
# [compiler] Version 0.5.0
# [reference]
# <1> https://atcoder.jp/contests/abc095/submissions/3181551

#==================================================================================================#
function isAddedValue( char )
	return Base.ifelse( Base.isequal(char, 'o'), 100, 0 )
end

function abc095_a()

	const val_base = 700

	# STEP.01
	# get the target order
	buffer = Base.readline( Base.STDIN )

	# STEP.02
	# count up the number of the topping
	val_total = val_base

	for itr in buffer
		val_total += Main.isAddedValue( itr )
	end

	# STEP.03
	# output the result
	Base.println( Base.STDOUT, val_total )

	# STEP.TRUE_END
	return Base.nothing

end

#==================================================================================================#

Main.abc095_a()
