class Piece
  attr_reader :color
  attr_writer :pos

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
      @board.on_board(pos) &&
        @color != @board[pos].color &&
        !move_into_check?(pos)
    end
  end

  private
  def move_into_check?(to_pos)
    begin
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
    rescue
      # We are moving onto our own pieces
      # Eventually, refactor this out
      true # We want to prune moves that are invalid
    end
  end
end
