require_relative "Piece.rb"
require_relative "Stepable.rb"

class King < Piece
  include Stepable

  def to_s
    @color == :white ? "\u2654" : "\u265A"
  end

  def symbol
    :k
  end

  def move_diffs
    diffs = [[1,0],[-1,0],[0,1],[0,-1], #side
             [1,1],[-1,-1],[1,-1],[-1,1] #diagonals
    ]
    super diffs
  end
end
