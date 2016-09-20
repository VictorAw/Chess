module Stepable
  def moves

  end

  private
  def move_diffs(offsets)
    offsets.map do |offset|
      offset[0] += @pos[0]
      offset[1] += @pos[1]
    end.delete_if do |move|
      not_valid_move?(move)
    end
  end

  def not_valid_move?(move)
    return false if move.between(0..8) &&
                    @board[move].color == @color
    true
  end
end
