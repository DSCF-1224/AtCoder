# [contests]   ExaWizards 2019
# [task]       A  
# [URL]        https://atcoder.jp/contests/exawizards2019/tasks/exawizards2019_a
# [compiler]   Julia (0.5.0)
# [submission] https://atcoder.jp/contests/exawizards2019/submissions/4826354 : AC
# [reference]  https://qiita.com/phigasui/items/2db20b36fb85e161e0ae

function readline_STDIN()
    return Base.readline(Base.STDIN)
end

function read_length_edges(stdin)
    return Base.parse.(Base.split(stdin))
end

function exawizards2019_A(A::Base.Int64, B::Base.Int64, C::Base.Int64)

    if Base.isequal(A, B) && Base.isequal(B, C)
        return "Yes"
    else
        return "No"
    end

end

#=======================#
# Main Process is below #
#=======================#

A, B, C = read_length_edges(readline_STDIN())
Base.println(Base.STDOUT, Main.exawizards2019_A(A, B, C))

#==================#
# End of this code #
#==================#
