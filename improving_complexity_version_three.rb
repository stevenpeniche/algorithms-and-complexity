require 'benchmark'

# This method takes n arrays as input and combine them in sorted ascending order
def poorly_written_ruby(arrays)
	combined_array = []
	look_up_hash = {}
	highest_value = 0
	highest_value_index = 0
	index = 0
	arrays.each do |array|
		array.each do |value|
			if value > highest_value
				highest_value = value
				highest_value_index = index
			end
			combined_array << value
			index += 1
		end
	end

	sorted_array = [combined_array.delete_at(highest_value_index)]

	for val in combined_array
	 i = 0
	 while i < sorted_array.length
	   if val <= sorted_array[i]
	     sorted_array.insert(i, val)
	     break
	   end
	   i+=1
	 end
	end

	# Return the sorted array
	sorted_array
end

data = [Array(1..100).shuffle, Array(101..200).shuffle, Array(201..300).shuffle]
time = Benchmark.realtime do
	poorly_written_ruby(data)
end

p "#{poorly_written_ruby(data)} took #{time*1000} milliseconds"
