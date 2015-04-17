class IterativePermutations
  def initialize(array)
    @current_permutation = array
    @index_to_rotate = 0
  end
  
  def nextPermutation
    array = @current_permutation
    array[@index_to_rotate],array[@index_to_rotate+1] = array[@index_to_rotate+1],array[@index_to_rotate]
    
    if @index_to_rotate >= array.length-2
      @index_to_rotate = 0
    else
      @index_to_rotate += 1
    end
    
    @current_permutation = array
  end
end