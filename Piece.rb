class Piece
  attr_reader :color

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def empty?
    false
  end

  def symbol
  end

  def valid_moves(moves)
    moves.select do |pos|
      x,y = pos
      @board.on_board(pos) &&
        @color != @board[pos].color &&
        !move_into_check?(pos)
    end
  end

  private
  def move_into_check?(to_pos)
    # Make the moves
    taken_piece = @board.move_piece!(@color, @pos, to_pos)

    # Are we in check?
    if @board.in_check?(@color)
      # If yes, undo move, return true
      @board.undo_move!(taken_piece, @pos, to_pos)
      true
    else
      # If no, undo move, return false
      @board.undo_move!(taken_piece, @pos, to_pos)
      false
    end
  end
end
