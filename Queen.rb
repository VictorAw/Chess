require_relative "Piece.rb"
require_relative "Slidable.rb"

class Queen < Piece
  include Slidable

  def to_s
    @color == :white ? "\u2655" : "\u265B"
  end

  def symbol
    :q
  end

  def move_dirs
    directions = { up: true, down: true, left: true, right: true,
                   up_left: true, up_right: true, #forward diagonals
                   down_left: true, down_right: true #backwards diagonals
                 }
    super(directions)
  end
end
