require_relative 'card'

class Board
  @@LETTERS = ["A", "A", "B", "B", "C", "C", "D", "D", "E", "E", "F", "F", "G", "G", "H", "H"]
  def initialize
    @grid = Array.new(5) {Array.new(5)}

  end

  def render
    @grid.each do |i|
      i.each do |j|
        puts j
      end
    end
  end

  def populate
    #fill board with a set of shuffled card pairs
    while @@LETTERS.length > 0
      i = rand(1..4)
      j = rand(1..4)
      if @grid[i][j] == nil
        char = @@LETTERS.pop()
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