require "colorize"
require_relative "Board.rb"
require_relative "Cursor.rb"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
    @notifications = {}
  end

  def move(new_pos)
  end

  def render
    puts @board.to_s
  end
end

b = Board.new
d = Display.new(b)
d.render
