# [contests]   ExaWizards 2019
# [task]       B  
# [URL]        https://atcoder.jp/contests/exawizards2019/tasks/exawizards2019_b
# [compiler]   Julia (0.5.0)
# [submission] https://atcoder.jp/contests/exawizards2019/submissions/4799802 : AC
# [reference]  https://qiita.com/phigasui/items/2db20b36fb85e161e0ae

function readline_STDIN()
    return Base.readline(Base.STDIN)
end

function exawizards2019_B()

    # STEP.01
    # read out the number of people
    num_people = Base.parse(Base.Int64, readline_STDIN())

    # STEP.02
    # read out the string which represents the colors of the people
    colors_people = readline_STDIN()

    # STEP.03
    # count up the number of hats
    num_people_red  = Base.zero(num_people)
    num_people_blue = Base.zero(num_people)

    for itr in Base.range(1, 1, num_people)
        if colors_people[itr] == 'R'
            num_people_red += 1
        else
            num_people_blue += 1
        end
    end

    # STEP.04
    # output the result
    if num_people_red > num_people_blue
        return "Yes"
    else
        return "No"
    end

end

#=======================#
# Main Process is below #
#=======================#

Base.println(Base.STDOUT, Main.exawizards2019_B())

#==================#
# End of this code #
#==================#
