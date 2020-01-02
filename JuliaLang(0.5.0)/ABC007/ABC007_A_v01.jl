# [contests]   ABC 007
# [task]       A  
# [URL]        https://atcoder.jp/contests/abc007/tasks/abc007_1
# [compiler]   Julia (0.5.0)
# [submission] https://atcoder.jp/contests/abc007/submissions/4835082 : AC

#===================================================================================#

function get_target_integer()
	return Base.parse(Base.Int64, Base.readline(Base.STDIN))
end

function println_result(retval::Base.Int64)
    Base.println(Base.STDOUT, retval)
end

function abc007_a()
	return get_target_integer() - 1
end

#===================================================================================#

Main.println_result(Main.abc007_a())
