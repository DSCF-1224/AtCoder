# ==================================================================================================================================
# contest  ABC 162
# task     A
# URL      https://atcoder.jp/contests/abc162/tasks/abc162_a
# compiler Julia (1.4.0)
# status   https://atcoder.jp/contests/abc162/submissions/12154804 : AC
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

    function evaluate_task_a(target_integer::Core.Int64)
        return Base.in( target_integer, Base.digits( AtCoder.readline(Core.Int64) ) ) ? "Yes" : "No"
    end

    function execute_task_a()
        Base.println(evaluate_task_a(7))
    end

end


ABC162.execute_task_a()
