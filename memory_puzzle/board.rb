require_relative 'card'
require 'byebug'

class Board
  @@LETTERS = ["A", "A", "B", "B", "C", "C", "D", "D", "E", "E", "F", "F", "G", "G", "H", "H"]
  def initialize
    @grid = Array.new(4) {Array.new(4)}

  end

  # def rows_and_col
  #   (1..4).each do |idx|
  #     @grid[0][idx] = idx-1
  #     @grid[idx][0] = idx-1
  #   end 
  #   @grid 
  # end 

  def render
    puts "  0 1 2 3"
    @grid.each_with_index do |row, idx|
      temp = []
      row.each do |ele|
        if ele.down == false
           temp << ele.face_value
        else 
          temp << ""
        end 
      end 
      print idx
      print " "
      puts temp.join(" ")
    end 
    
  end 


  def populate
    #fill board with a set of shuffled card pairs
    while @@LETTERS.length > 0
      i = rand(0..3)
      j = rand(0..3)
      if @grid[i][j] == nil
        char = @@LETTERS.pop
        @grid[i][j] = Card.new(char)
      end
    end 
  end

  def won?
    # debugger
    #return true if all cards have been revealed
    @grid.flatten.all? { |card| card.down == false}
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end 

  def revealed(guessed_pos)
    #reveal a Card at guessed_pos(unless it's face up, in which do nothing)
    #return the value of the Card revealed
    # debugger
      if self[guessed_pos].down == true
        card = self[guessed_pos]
        card.reveal
        # debugger
        return card.face_value
      end
  end 

end