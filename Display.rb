require "colorize"
require "Cursor.rb"

class Display
  def initialize
    @cursor = Cursor.new([0, 0], board)
    @notifications = {}
  end

  def move(new_pos)
  end

  def render
    
  end
end
