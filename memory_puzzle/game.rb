require_relative 'board'
# require "byebug"

class Game
  # attr_reader :display
  def initialize
    @board = Board.new()
    @previous_guess = nil
    @board.populate
    
    # @display = @board.render
  end

  def play
    
    # debugger
    while !@board.won?
      system("clear")
      @board.render
      puts "Please enter a position"
      # add a loop for gets chomp within bounds
      input = gets.chomp
      n_input = input.split(" ").map! { |ele| ele.to_i}
      # debugger
      guess = @board.revealed(n_input)
      if @previous_guess == nil
        @board.render
        @previous_guess = n_input
      else 
        @board.render
        if @board[@previous_guess].face_value == @board[n_input].face_value
          @previous_guess = nil
        else
          sleep(3)
          @board[@previous_guess].hide
          @board[n_input].hide
          @previous_guess = nil
        end
      end
  end
   print "You won!"
end


end


# g = Game.new
# g.play