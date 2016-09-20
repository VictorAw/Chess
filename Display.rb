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

  # TODO: Fix bug where "\n" gets overwritten b
  # cursor. Move cursor to next char?
  def render
    clear_terminal
    grid = @board.to_s # Grid is a string
    cursor_pos = @cursor.cursor_pos
    row, col = cursor_pos
    grid[row*18+(col*2)+1] = "\e[38;2;255;255;255m\u25A3\e[0m"

    puts grid
  end

  # TODO: Find a better solution for clearing terminal
  def clear_terminal
    system "clear" or system "cls"
  end

  def get_move
    @cursor.get_input
  end
end

b = Board.new
d = Display.new(b)
while true
  d.render
  d.get_move
end
