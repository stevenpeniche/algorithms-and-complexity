require 'benchmark'

def poorly_written_ruby(arrays)
	combined_array = []
	for array in arrays
		for value in array
			combined_array.push value
		end
	end

	sorted_array = [combined_array.pop]

	for val in combined_array
		i = 0
		while i < sorted_array.length
			if val < sorted_array[i]
				sorted_array.insert(i, val)
				break
			elsif i == sorted_array.length - 1
				sorted_array.push val
				break
			end
			i+=1
		end
	end

	sorted_array
end

data = [Array(1..100).shuffle, Array(101..200).shuffle, Array(201..300).shuffle]
time = Benchmark.realtime do
	poorly_written_ruby(data)
end

p "#{poorly_written_ruby(data)} took #{time*1000} milliseconds"
