require_relative "Piece.rb"
require_relative "Slidable.rb"

class Queen < Piece
  include Slidable

  def to_s
    @color == :black ? "\u2655" : "\u265B"
  end

  def symbol
  end

  def move_dirs
  end
end
