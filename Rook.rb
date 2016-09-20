require_relative "Piece.rb"
require_relative "Slidable.rb"

class Rook < Piece
  include Slidable

  def to_s
    @color == :black ? "\u2656" : "\u265C"
  end

  def symbol
  end

  def move_dirs
    [:up, :down, :left, :right]
  end
end
