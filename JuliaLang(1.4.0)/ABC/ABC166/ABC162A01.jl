# ==================================================================================================================================
# contest  ABC 166
# task     A
# URL      https://atcoder.jp/contests/abc162/tasks/abc166_a
# compiler Julia (1.4.0)
# status   https://atcoder.jp/contests/abc166/submissions/12714683 : AC
# ==================================================================================================================================

module ABC162
 
    export execute_task_a
 
    function evaluate_task_a(given_string::Core.AbstractString)
        return given_string == "ABC" ? "ARC" : "ABC"
    end
 
    function execute_task_a()
        Base.println( evaluate_task_a(Base.readline(Base.stdin)) )
    end
 
end


ABC162.execute_task_a()
