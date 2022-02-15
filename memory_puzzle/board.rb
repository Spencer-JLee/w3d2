require_relative 'card'

class Board
  @@LETTERS = ["A", "A", "B", "B", "C", "C", "D", "D", "E", "E", "F", "F", "G", "G", "H", "H"]
  def initialize
    @grid = Array.new(5) {Array.new(5)}

  end

  def rows_and_col
    (1..4).each do |idx|
      @grid[0][idx] = idx-1
      @grid[idx][0] = idx-1
    end 
    @grid 
  end 

  def render
    @grid.each do |row|
      temp = []
      row.each do |ele|
      if ele != nil && !(0..4).to_a.include?(ele)
        if ele.down == false
           temp << ele.face_value
        else 
          temp << ""
        end 
      end 
      puts temp.join(" ")
    end 
    
  end 
end 


  def populate
    #fill board with a set of shuffled card pairs
    while @@LETTERS.length > 0
      i = rand(1..4)
      j = rand(1..4)
      if @grid[i][j] == nil
        char = @@LETTERS.pop
        @grid[i][j] = Card.new(char)
      end
    end 
  end

  def won?
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
      if self[guessed_pos] == true
        card = self[guessed_pos]
        card.reveal
        return card.face_value
      end
  end 

end