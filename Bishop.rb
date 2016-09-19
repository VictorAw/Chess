require_relative "Piece.rb"
require_relative "Slidable.rb"

class Bishop < Piece
  include Slidable

  def to_s
    @color == :black ? "\u2657" : "\u265D"
  end

  def symbol
  end

  def move_dirs
  end
end
