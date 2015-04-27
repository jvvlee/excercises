# Given an array of n elements which contains elements from 0 to n-1, with any of these numbers appearing any number of times. 
# Find these repeating numbers in O(n) and using only constant memory space.

# For example, let n be 7 and array be {1, 2, 3, 1, 3, 6, 6}, the answer should be 1, 3 and 6.

# 6, 5, 4, 6, 4, 1 ,1
def dupes(array)
  len = array.length
  (0..len).each do |num|
    if array[abs(array[num])] > 0
      array[abs(array[num])] *= -1 #turns number at index negative
    else
      puts array[abs(array[num])]
    end
    
  end
end

#This has very limited utility to be honest, given the number of things that could go wrong.
#If the length of the array is less than the greatest number this will not work
#
# Write a method that takes a hash of symbol keys, for which the values are integers representing each key's weight. 
# The method returns a key such that the chances of selecting a particular key are weighted by that key's value.

# For the hash {:a => 1, :b => 2, :c => 3}, the chance of returning :c is 1/2, :b is 1/3, and :a is 1/6.