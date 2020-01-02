# [contests]   ABC123
# [task]       B
# [URL]        https://atcoder.jp/contests/abc123/tasks/abc123_b
# [compiler]   Julia (0.5.0)
# [submission] NOT submitted

module ABC123

	# consts for this <module>
	const num_dishes =  5
	const time_unit  = 10

	# variable for this <module>
	required_time_total = Base.typemax(Base.Int64)
	required_time       = Base.Array{Base.Int64}(num_dishes)
	order_dishes        = Base.Array{Base.Int64}(num_dishes)

	# [reference]
	# 1. https://rosettacode.org/wiki/Permutations
	# 2. https://rosettacode.org/wiki/Permutations#Fortran
	# 3. https://rosettacode.org/wiki/Permutations#Julia
	function permutations(i::Base.Int64)

		if Base.isequal(i, num_dishes)
			Base.println(order_dishes[1:end])
		else
			for j in Base.range(i, num_dishes)
				order_dishes[i], order_dishes[j] = order_dishes[j], order_dishes[i]
				permutations(i + 1)
				order_dishes[i], order_dishes[j] = order_dishes[j], order_dishes[i]
			end
		end

		return Base.nothing

	end

	function read_Int64()
		return Base.parse(Base.Int64, Base.readline(Base.STDIN))
	end

	function task_A()
	
		# STEP.01
		# read out the required times to receive the each dish
		for itr in Base.range(1, 1, num_dishes)
			required_time[itr] = read_Int64()
		end
	
		for itr in Base.range(1, 1, num_dishes)
			order_dishes[itr] = itr
		end
	
		permutations( Base.one(Base.Int64) )

		return Base.nothing
	
	end
end

#=======================#
# Main Process is below #
#=======================#

Main.ABC123.task_A()

#==================#
# End of this code #
#==================#
