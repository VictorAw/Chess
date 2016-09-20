require "byebug"
module Slidable
  def moves
    valid_moves(self.move_dirs)
  end

  private
  def move_dirs(directions)
    # debugger
    horizontal_dirs(directions) + diagonal_dirs(directions)
  end

  def horizontal_dirs(directions)
    all_horizontal_moves = []
    if directions[:up]
      all_horizontal_moves += grow_unblocked_moves_in_dir(-1, 0)
    end
    if directions[:down]
      all_horizontal_moves += grow_unblocked_moves_in_dir(1, 0)
    end
    if directions[:left]
      all_horizontal_moves += grow_unblocked_moves_in_dir(0, -1)
    end
    if directions[:right]
      all_horizontal_moves += grow_unblocked_moves_in_dir(0, 1)
    end
    all_horizontal_moves
  end

  def diagonal_dirs(directions)
    all_diagonal_moves = []
    if directions[:up_left]
      all_diagonal_moves += grow_unblocked_moves_in_dir(-1, -1)
    end
    if directions[:up_right]
      all_diagonal_moves += grow_unblocked_moves_in_dir(-1, 1)
    end
    if directions[:down_left]
      all_diagonal_moves += grow_unblocked_moves_in_dir(1, -1)
    end
    if directions[:down_right]
      all_diagonal_moves += grow_unblocked_moves_in_dir(1, 1)
    end
    all_diagonal_moves
  end

  def opponent_piece?(pos)
    @board[pos].color != @color
  end

  def empty?(pos)
    @board[pos].empty?
  end

  def grow_unblocked_moves_in_dir(dy, dx)
    # debugger
    pos = @pos.dup
    unblocked_moves = []
    y,x = pos
    pos = [dy + y, dx + x]

    while @board.on_board(pos) &&
          (opponent_piece?(pos) || empty?(pos))
      y,x = pos
      unblocked_moves << pos
      break if opponent_piece?(pos) && !empty?(pos)
      pos = [dy + y, dx + x]
    end
    unblocked_moves
  end
end
