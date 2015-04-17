class Bnop
  def initialize(array)
    @already_found = Hash.new()
    @array = array
    @count = 0
    @switch_index = 0
  end
  
  def next
    if @count < @array.length
      @array = self.class.rotate(@array)
      return @array
    end
    
    @count = 0
    
    @array[], @array
    
     
    
  end
  
  private 
  
  def self.rotate(array)
    array.unshift(array.pop)
    @count += 1
  end
end