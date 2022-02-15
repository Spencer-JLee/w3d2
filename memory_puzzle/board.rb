class Board
  def initialize
    @grid = Array.new(4) {Array.new(4)}

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
    
  end

  def won?
    #return true if all cards have been revealed
  end

  def revealed
    #reveal a Card at guessed_pos(unless it's face up, in which do nothing)
    #return the value of the Card revealed
  end
end