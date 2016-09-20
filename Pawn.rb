require_relative "Piece.rb"

class Pawn < Piece

  def to_s
    @color == :white ? "\u2659" : "\u265F"
  end

  def symbol
    :p
  end

  def moves
    valid_moves(forward_steps + side_attacks)
  end

  # TODO: Make this not hard coded
  protected
  def at_start_row?
    return true if @color == :black && @pos[0] == 1
    return true if @color == :white && @pos[0] == 6
    false
  end

  def forward_dir
    @color == :white ? -1 : 1
  end

  def forward_steps
    forward_moves = []
    starting_pos = @pos.dup
    starting_pos[0] += forward_dir
    forward_moves << starting_pos if @board[starting_pos].empty?
    if at_start_row?
      starting_pos = starting_pos.dup
      starting_pos[0] += forward_dir
      forward_moves << starting_pos if @board[starting_pos].empty?
    end
    forward_moves
  end

  def side_attacks
    # if there a diagonal that is one move away and
    #  your opponents piece is there, you can move there
    # forward_left (-1,-1) if white
    # forward_Right (-1,1) if white
    # F_L for black (1, -1)
    # F_R for black (1, 1)
    side_moves = []

    starting_pos = @pos.dup
    starting_pos[0] += forward_dir
    starting_pos[1] -= 1
    side_moves << starting_pos unless @board[starting_pos].empty?
    starting_pos = starting_pos.dup
    starting_pos[1] += 2
    side_moves << starting_pos unless @board[starting_pos].empty?

    side_moves
  end

end
