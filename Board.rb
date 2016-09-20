require_relative "Pawn.rb"
require_relative "Rook.rb"
require_relative "Knight.rb"
require_relative "Bishop.rb"
require_relative "Queen.rb"
require_relative "King.rb"
require_relative "NullPiece.rb"

class Board
  def initialize(grid = make_starting_grid)
    @grid = grid
  end
=begin
  def top_str
    ret = " \u2554"
    8.times { ret << "\u2550\u2566" }
    ret << "\u2550\u2557"
  end

  def divider_str
		ret = " \u2560"
		9.times { ret << "\u2550\u256C" }
		ret << "\u2550\u2563"

		ret
	end

  def row_str(row, col_end, hidden)
    ret = "#{row}"
    for i in 0..col_end
      # If the game is over or the square is not occupied by a ship,
      # draw that shape, otherwise hide the ship
      ret << "\u2551#{char_at(row, i, hidden)}"
    end
    ret << "\u2551"

    ret
  end

  def bottom_str
    ret = " \u255A"
    9.times { ret << "\u2550\u2569" }
    ret << "\u2550\u255D"

    ret
  end
=end
  def to_s
    ret = ""

    @grid.each do |row|
      row_str = " "
      row.each do |piece|
        row_str << piece.to_s << " "
      end
      row_str << "\n"
      ret << row_str
    end

    ret
  end

  protected

  def make_starting_grid
    grid = []
    grid << make_back_row(:black, :top)
    grid << make_front_row(:black, :top)
    4.times { grid << make_empty_row }
    grid << make_front_row(:white, :bottom)
    grid << make_back_row(:white, :bottom)
  end

  private

  def make_back_row(color, player_pos)
    array = []
    pos = [0, 0]
    if player_pos == :bottom
      pos = [7, 0]
    end

    array << Rook.new(color, self, pos.dup)
    pos[1] += 1
    array << Knight.new(color, self, pos.dup)
    pos[1] += 1
    array << Bishop.new(color, self, pos.dup)
    pos[1] += 1
    array << Queen.new(color, self, pos.dup)
    pos[1] += 1
    array << King.new(color, self, pos.dup)
    pos[1] += 1
    array << Bishop.new(color, self, pos.dup)
    pos[1] += 1
    array << Knight.new(color, self, pos.dup)
    pos[1] += 1
    array << Rook.new(color, self, pos.dup)

    array
  end

  def make_front_row(color, player_pos)
    array = []
    pos = [1, 0]
    if player_pos == :bottom
      pos = [6, 0]
    end

    8.times do |i|
      array << Pawn.new(color, self, pos.dup)
      pos[1] += 1
    end

    array
  end

  def make_empty_row
    array = []
    8.times { array << NullPiece.instance }
    array
  end

  public

  def [](pos)
    y, x = pos
    @grid[y][x]
  end

  def []=(pos, piece)
    y, x = pos
    @grid[y][x] = piece
  end

  def dup
    # Not sure what this is for, if we need a completely new
    # copy with new pieces, will need to construct new pieces
    # somewhere
    # grid = []
    # @grid.each do |el|
    #   row = []
    #   el.each do |piece|
    #     row << piece.dup unless piece.is_a?(NullPiece)
    #     row << piece if piece.is_a?(NullPiece)
    #   end
    #   grid << row
    # end
    # Board.new(grid)
  end

  def move_piece(color, from, to)
    # Not sure how this will work until we know what dup is for
    # self.dup.move_piece!(color, from, to)
  end

  def move_piece!(color, from, to)
    raise "There is no piece in that square" if from.empty?
    raise "There is already a piece in that square" unless to.empty?
    raise "Moving other player's piece" if color != self[from].color

    self[from], self[to] = self[to], self[from]
  end

  def checkmate?
  end

  protected

  def find_king(color)
  end

end
