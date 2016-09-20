require_relative "Piece.rb"
require_relative "Slidable.rb"

class Bishop < Piece
  include Slidable

  def to_s
    @color == :white ? "\u2657" : "\u265D"
  end

  def symbol
    :b
  end

  def move_dirs
    directions = { up_left: true, up_right: true, #forward diagonals
                   down_left: true, down_right: true #backwards diagonals
                 }
    super(directions)
  end
end
