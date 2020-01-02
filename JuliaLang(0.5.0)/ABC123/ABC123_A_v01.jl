# [contests]   ABC123
# [task]       A  
# [URL]        https://atcoder.jp/contests/abc123/tasks/abc123_a
# [compiler]   Julia (0.5.0)
# [submission] https://atcoder.jp/contests/abc123/submissions/4876128 : AC

function read_Int64()
	return Base.parse(Base.Int64, Base.readline(Base.STDIN))
end

function abc123_A()

	const num_antennas = 5

	# STEP.01
	# read out the coordinates of the each antenna
	coordinate = Base.Array{Base.Int64}(num_antennas)

	for itr in Base.range(1, 1, num_antennas)
		coordinate[itr] = read_Int64()
	end

	# STEP.02
	# read out the maximum distance to communicate
	distance_max = read_Int64()

	for itr_Lv1 in Base.range(1, 1, num_antennas)
	for itr_Lv2 in Base.range(1, 1, num_antennas)
		if Base.abs(coordinate[itr_Lv2] - coordinate[itr_Lv1]) > distance_max
			return ":("
		else
			continue
		end
	end
	end

	return "Yay!"

end

#=======================#
# Main Process is below #
#=======================#

Base.println(Base.STDOUT, Main.abc123_A())

#==================#
# End of this code #
#==================#
