class Player
  attr_reader :color
  def initialize(color)
    @color = color
  end
end

class HumanPlayer < Player
  def make_move
  end
end

class ComputerPlayer < Player
  def make_move
  end
end
