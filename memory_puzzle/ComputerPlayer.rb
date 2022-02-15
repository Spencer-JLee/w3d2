

class ComputerPlayer
  attr_reader :hash

    def initialize(name)
      @name = name
      @hash = Hash.new {|h,k| h[k] = []}
    end 

    def receive_revealed_card(pos, val)
      @hash[pos] << val
    end 

    def receive_match(pos1, pos2)

    end 



end 