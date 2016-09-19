require_relative "Piece.rb"
require_relative "Stepable.rb"

class Knight < Piece
  include Stepable

  def to_s
    @color == :black ? "\u2658" : "\u265E"
  end

  def symbol
  end

  def move_diffs
  end
end
