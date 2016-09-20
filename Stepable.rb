module Stepable
  def moves
    valid_moves(self.move_diffs)
  end

  private
  def move_diffs(offsets)
    # debugger
    offsets.map do |offset|
      [offset[0] + @pos[0], offset[1] + @pos[1]]
    end
  end

end
