# Black tiles = 102, 51, 0
# White tiles = 255, 153, 51
module ChessColors
  class Color
    attr_reader :r, :g, :b

    def initialize(r, g, b)
      @r, @g, @b = r, g, b
    end
  end

  def color_str(color, str)
    # Black tile if one is odd
    # White tile if both are equal to each other
    c = Color.new(255, 153, 51) if color == :white
    c = Color.new(102, 51, 0) unless color == :white

    str_black_white_tiles(c, str)
  end

  def str_black_white_tiles(color, str)
    "\e[48;2;#{color.r};#{color.g};#{color.b}m#{str}\e[0m"
  end
end
