# [contests]   ABC 006
# [task]       A  
# [URL]        https://atcoder.jp/contests/abc006/tasks/abc006_1
# [compiler]   Julia (0.5.0)
# [submission] https://atcoder.jp/contests/abc006/submissions/4835047 : AC

#===================================================================================#

function get_target_integer()
	return Base.parse(Base.Int64, Base.readline(Base.STDIN))
end

function println_result(retval::Base.AbstractString)
    Base.println(Base.STDOUT, retval)
end

function abc006_a()

	# STEP.01
	# get the target number
    n = Main.get_target_integer()

	# STEP.02
	# output the result
	if Base.rem(n, 3) == 0
		return "YES"
	else
		return "NO"
    end

end

#===================================================================================#

Main.println_result(Main.abc006_a())
