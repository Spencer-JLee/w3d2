require_relative 'board'
require_relative 'human_player'
# require "byebug"

class Game
  # attr_reader :display
  def initialize(name)
    @board = Board.new()
    @previous_guess = nil
    @board.populate
    @player = HumanPlayer.new(name)
    # @display = @board.render
  end

  def play
    
    # debugger
    while !@board.won?
      system("clear")
      @board.render
      # puts "Please enter a position"
      # # add a loop for gets chomp within bounds
      # input = gets.chomp
      # while !valid_input?(input)
      #   puts "That wasn't right. Enter again"
      #   input = gets.chomp
      # end
      # # debugger
      # n_input = input.split(" ").map! { |ele| ele.to_i}
      n_input = @player.prompt
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
  #  def valid_input?(str)
  #   n_input = str.split(" ").map! { |ele| ele.to_i}
  #   (0..3).include?(n_input[0]) && (0..3).include?(n_input[1])
  #   end
end




# g = Game.new
# g.play