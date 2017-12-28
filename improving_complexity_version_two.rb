require 'benchmark'

# Combines sub arrays into one array
def combine(arrays)
	combined_array = []
	arrays.each do |array|
		array.each do |value|
			combined_array << value
		end
	end

	combined_array
end
# Insertion_sort method for bucket_sort
def insertionsort(array)
  i = 1
  while i < array.length
    element = array[i]
    j = i - 1
    while j >= 0 && array[j] > element
      array[j + 1] = array[j]
      j -= 1
    end
    array[j + 1] = element
    i += 1
  end
end
# Sorts array
def bucket_sort(array, bucket_size = 5)
  if array.empty?
    return array
  end

  max_value = array.max
  min_value = array.min

  # Initialize buckets
  bucket_count = ((max_value - min_value) / bucket_size).floor + 1
  buckets = Array.new(bucket_count)
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

  # Distribute array elements into buckets
  (0..array.length - 1).each do |i|
    buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
  end

  # Sort buckets and place into original array
  array.clear
  (0..buckets.length - 1).each do |i|
    insertionsort(buckets[i])
    buckets[i].each do |element|
      array.push(element)
    end
  end
  array
end

# Takes n arrays as input and combines them in sorted ascending order
def poorly_written_ruby(arrays)
	if arrays.length > 1
		return bucket_sort(combine(arrays))
	elsif arrays.length == 1
		bucket_sort(arrays[0])
		return arrays[0]
	else
		return arrays
	end
end

data = [Array(1..100).shuffle, Array(101..200).shuffle, Array(201..300).shuffle]
time = Benchmark.realtime do
	poorly_written_ruby(data)
end

p "#{poorly_written_ruby(data)} took #{time*1000} milliseconds"
