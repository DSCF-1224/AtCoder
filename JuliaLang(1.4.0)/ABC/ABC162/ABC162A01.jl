# ==================================================================================================================================
# contest  ABC 162
# task     A
# URL      https://atcoder.jp/contests/abc162/tasks/abc162_a
# compiler Julia (1.4.0)
# status   https://atcoder.jp/contests/abc162/submissions/12145028 : AC
# ==================================================================================================================================

module AtCoder

    export readline

    function readline(T)
        return Base.parse(T, Base.readline(Base.stdin))
    end

end


module ABC162

    import Main.AtCoder
    export task_a

    function task_a(target_integer::Core.UInt16)

        given_integer = AtCoder.readline(Core.UInt16)
        data_digits   = Base.digits(given_integer)

        for itr = 1:1:Base.size(data_digits, 1)
            if (data_digits[itr] == target_integer)
                return "Yes"
            end
        end

        return "No"

    end

end

Base.println(ABC162.task_a(Base.convert(Core.UInt16, 7)))
