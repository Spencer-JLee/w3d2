class HumanPlayer
  def initialize(name)
    @name = name
  end

  def prompt
    puts "Please enter a position"
      # add a loop for gets chomp within bounds
      input = gets.chomp
      while !valid_input?(input)
        puts "That wasn't right. Enter again"
        input = gets.chomp
      end
      # debugger
      n_input = input.split(" ").map! { |ele| ele.to_i}
  end

  # def get_input

  # end

  def valid_input?(str)
    n_input = str.split(" ").map! { |ele| ele.to_i}
    (0..3).include?(n_input[0]) && (0..3).include?(n_input[1])
  end
end