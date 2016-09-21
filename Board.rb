require_relative "Pawn.rb"
require_relative "Rook.rb"
require_relative "Knight.rb"
require_relative "Bishop.rb"
require_relative "Queen.rb"
require_relative "King.rb"
require_relative "NullPiece.rb"
require_relative "ChessColors.rb"

class Board
  include ChessColors

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

    @grid.each_with_index do |row, i|
      row_str = " "
      if i % 2 == 0
        color = :white
      else
        color = :black
      end
      row.each_with_index do |piece, j|
        color = color == :white ? :black : :white

        char = piece.to_s#color_str(color, piece.to_s)
        row_str << char << " "
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

  def on_board(pos)
    pos[0] >= 0 && pos[1] >= 0 && pos[0] < 8 && pos[1] < 8
  end

=begin
  def dup

  end

  def move_piece(color, from, to)
  end
=end

  # Returns any taken pieces
  def move_piece!(color, from, to)
    raise "There is no piece in that square" if from.empty?
    raise "Moving onto your own piece" if color == self[to].color

    taken_piece = self[to].dup unless self[to].symbol == :n
    self[to] = NullPiece.instance # "Take" opponent's pieces
    self[from].pos = to
    self[from], self[to] = self[to], self[from]

    taken_piece
  end

  def undo_move!(taken_piece, from, to)
    self[to].pos = from
    self[from], self[to] = self[to], self[from]
    self[to] = taken_piece unless taken_piece.symbol == :n
  end

  def in_check?(color)
    king_pos = find_king(color)
    valid_moves = []
    if color == :white
      valid_moves = all_valid_moves_for_player(:black)
    else
      valid_moves = all_valid_moves_for_player(:white)
    end
    # Check to see if any of them == king_pos
    valid_moves.include?(king_pos)
  end

  def all_valid_moves_for_player(color)
    # Iterate over all of the player's pieces and take their valid moves
    valid_moves = []
    @grid.each do |row|
      row.each do |piece|
        valid_moves += piece.moves if piece.color == color
      end
    end
    valid_moves
  end

require "byebug"
  def checkmate?(color)
       debugger
    if in_check?(color) # looping a lot
      valid_moves = all_valid_moves_for_player(color)
      return true if valid_moves.empty?
    end

    false
  end

  protected

  def find_king(color)
    # Iterate over all the pieces in the grid
    @grid.each_with_index do |row, y|
      row.each_with_index do |piece, x|
        return [y, x] if piece.symbol == :k && piece.color == color
        # For some reason if piece.is_a?(King) causes stack levle too deep error
      end
    end

    nil
  end
end

if __FILE__ == $PROGRAM_NAME
  grid = Array.new(8) { Array.new(8) { NullPiece.instance }}
  b = Board.new(grid)
  # grid[0][0] = King.new(:black, b, [0, 0])
  # # grid[1][1] = Pawn.new(:white, b, [1, 1])
  # # grid[1][0] = Pawn.new(:white, b, [1, 0])
  # grid[2][1] = Rook.new(:white, b, [2, 1])
  # grid[2][0] = Rook.new(:white, b, [2, 0])
  # grid[7][7] = King.new(:white, b, [7, 7])
  # p b.checkmate?(:black)
  grid[0][0] = Rook.new(:black, b, [0, 0])
  puts "0, 0 is a #{b[[0, 0]].class}"
  puts "1, 0 is a #{b[[1, 0]].class}"
  b.move_piece!(:black, [0, 0], [1, 0])
  puts "0, 0 is a #{b[[0, 0]].class}"
  puts "1, 0 is a #{b[[1, 0]].class}"
end
