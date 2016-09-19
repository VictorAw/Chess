require_relative "Piece.rb"

class Pawn < Piece
  def to_s
    @color == :black ? "\u2659" : "\u265F"
  end

  def symbol
  end

  def moves
  end

  protected
  def at_start_row?
  end

  def forward_dir
  end

  def forward_steps
  end

  def side_attacks
  end

end
