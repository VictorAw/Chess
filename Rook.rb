require_relative "Piece.rb"
require_relative "Slidable.rb"

class Rook < Piece
  include Slidable

  def to_s
    @color == :white ? "\u2656" : "\u265C"
  end

  def symbol
    :r
  end

  def move_dirs
    directions = { up: true, down: true, left: true, right: true }
    super(directions)
  end
end
