require_relative 'board'

class Game
  def initialize
    @board = Board.new()
    @previous_guess = nil
  end

  def play
    @board.populate
    while !@board.won?
      system("clear")
      @board.render
      puts "Please enter a position"
      input = gets.chomp
      input.split(" ").map! { |ele| ele.to_i}
      guess = @board.revealed(input)
      if @previous_guess == nil
        @board.render
        @previous_guess = input
      else 
        if @board[@previous_guess] == @board[input]
          @previous_guess = nil
        else
          sleep(3)
          @board[@previous_guess].hide
          @board[input].hide
          @previous_guess = nil
        end
      end
      print "You won!"
  end
end
end