require "singleton"

class NullPiece
  include Singleton

  def moves
    []
  end

  def symbol
    :n
  end

  def color
    :null
  end

  def to_s
    " "
  end

  def empty?
    true
  end
end
