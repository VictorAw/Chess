require_relative "Piece.rb"
require_relative "Slidable.rb"

class Queen < Piece
  include Slidable

  def symbol
  end

  def move_dirs
  end
end
