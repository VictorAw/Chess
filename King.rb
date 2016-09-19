require_relative "Piece.rb"
require_relative "Stepable.rb"

class King < Piece
  include Stepable

  def to_s
    @color == :black ? "\u2654" : "\u265A"
  end

  def symbol
  end

  def move_diffs
  end
end
