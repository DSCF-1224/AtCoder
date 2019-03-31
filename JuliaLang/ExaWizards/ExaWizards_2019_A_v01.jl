# [contests]   ExaWizards 2019
# [task]       A  
# [URL]        https://atcoder.jp/contests/exawizards2019/tasks/exawizards2019_a
# [compiler]   Julia (0.5.0)
# [submission] https://atcoder.jp/contests/exawizards2019/submissions/4788797 : AC
# [reference]  https://qiita.com/phigasui/items/2db20b36fb85e161e0ae

function exawizards2019_A()

    # STEP.01
    # read out the given integers
    A, B, C = Base.parse.(Base.split(Base.readline(Base.STDIN)))

    # STEP.02
    # determine if there exists an equilateral triangle whose sides have lengths A, B and C.
    if Base.isequal(A, B) && Base.isequal(B, C)
        Base.println(Base.STDOUT, "Yes")
    else
        Base.println(Base.STDOUT, "No")
    end

    # STEP.TRUE_END
    return Base.nothing

end

#=======================#
# Main Process is below #
#=======================#

Main.exawizards2019_A()

#==================#
# End of this code #
#==================#
