require_relative 'board'
require_relative 'game'

class Card

  attr_reader :down
  
  def initialize(face_value)
    @face_value = face_value
    @down = true
  end

  def face_value
    if @down == true
      return ""
    else 
      return @face_value
    end 
  end 

  def hide
    @down = true
    
  end

  def reveal
    @down = false
  end

  # def to_s
    
  # end

  # def ==
    
  # end
end