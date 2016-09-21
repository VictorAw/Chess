class Player
  attr_reader :color
  def initialize(color, display=nil)
    @color = color
    @display = display
  end

  def display=(display)
    @display = display
  end
end

class HumanPlayer < Player
  def make_move
    inputs = []

    loop do
      #@display.clear_terminal
      @display.render
      prompt_from
      input = @display.get_move
      if input
        inputs << input
        break
      end
    end

    loop do
      #@display.clear_terminal
      @display.render
      prompt_to
      input = @display.get_move
      if input
        inputs << input
        break
      end
    end

    inputs
  end

  def prompt_from
    puts "Where do you want to move from?"
    puts "(Press space or enter to select square)"
  end

  def prompt_to
    puts "Where do you want to move to?"
    puts "(Press space or enter to select square)"
  end
end

class ComputerPlayer < Player
  def make_move
  end
end
