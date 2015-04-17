class LightsPattern
  def initialize(matrix)
    @matrix = matrix
  end
  
  def find_colors #finds the longest sequential column or row of bulbs
    greatest = 0
    longest = nil
    
    @matrix.each do |row| 
      lights = row.select{|i| i == 1}.length
      
      if lights > greatest
        greatest = lights
        longest = :row
      end
      
      break if greatest = row.length
    end
    
    columns = @matrix[0].length
    
    (0..columns-1).each do |column|
      lights = []
      @matrix.each do |array|
        lights.push(array[column])
      end
      
      lights.select!{|i| i == 1}
      
      if lights.length > greatest
        greatest = lights.length
        longest = :column
      end
    end
    
    return {longest => greatest}
  end 
  
  def printSolution
    #I will use the transpose either way, because it will allow me to keep track of what items to put into a row or column
    #I'll want to call map on each row/column to modify the array in place
    #Based on what find_colors returns, that's how I should fill in things.
    
    #I should have the original, and a transposed matrix each filled with the numbers I intend to use, assume that the transposed matrix is full of ones.
    @matrix 
    
    #To fulfill cases where there are no gaps, it is trivial. Just rotate the max number series you have
    #Otherwise I need to check through ALL possible permutations and check for the validity of each placed configuration
    #
    #IDEA: Do rotations first. If all rotations fail, then do a switch.
    #This misses on some permutations. To get the correct answer every time, all permutations must be found, so just do the switch. (n! time)
    #A case for the former could be made in that it should work on most symmetrical designs, which are most likely going to be implemented.
    #Disproven, there will still be duplicates
    #
    #New idea, the position to stop prematurely increases at each step.
  end
  
  def transpose
    new_row_length = @matrix.length
    row_length = @matrix[0].length
    
    transposed_matrix = []
    
    (0..row_length-1).each do |new_column_idx| 
      row = []
      
      (0..new_row_length-1).each do |new_row_idx|
        row << @matrix[new_row_idx][new_column_idx]
      end
      
      transposed_matrix << row
    end
  
    return transposed_matrix
  end
  
end
