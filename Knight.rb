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
    diffs = [[-2, -1], [-2, 1], # Up
             [-1, 2],  [1, 2],  # Right
             [2, -1],  [2, 1],  # Down
             [-1, -2], [1, -2]  # Left
    ]
    super diffs # Passes diffs into Stepable
  end
end
