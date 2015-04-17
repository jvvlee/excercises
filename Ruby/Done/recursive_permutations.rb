def recursive_permutations(array)
  return [array] if array.length == 1

  el = array[0]
  permutations = []

  recursive_permutations(array[1..-1]).each do |short_array|
    (0..short_array.length).each do |i|
      permutations << short_array[0...i] + [el] + short_array[i..-1]
    end
  end

  return permutations
end

def recursive_subsets(array)
  return [[]] if array.empty?
  
  el = array[0]
  
  sub_subsets = recursive_subsets(array[1..-1])
  subsets = sub_subsets.map {|sub| sub + [el]} #watch for pass-by-reference here
  subsets.concat(sub_subsets)
  
  return subsets
end