require_relative "Board.rb"
require_relative "Display.rb"
require_relative "Player.rb"
require "byebug"
class Chess
  def initialize(player1, player2)
    @board = Board.new
    @display = Display.new(@board)
    @player1 = player1
    @player2 = player2
    @player1.display = @display
    @player2.display = @display
    @current_player = @player1
  end

  def play
    puts "Welcome to Chess!"
    until won?
      play_turn
      switch_player!
    end
    "Winner is #{winner}!"
  end

  def play_turn
    begin
      p @board
      puts
      puts
      move = @current_player.make_move
      @board.move_piece!(@current_player.color, move[0], move[1])
      puts
      puts
    rescue => e
      puts e.message
      retry
    end
  end

  def switch_player!
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def won?
    @board.checkmate?(@player1.color) ||
      @board.checkmate?(@player2.color)
  end

  def winner
    return @player1 if @board.checkmate?(@player2.color)
    return @player2 if @board.checkmate?(@player1.color)
  end
end

if __FILE__ == $PROGRAM_NAME
  p1 = HumanPlayer.new(:white)
  p2 = HumanPlayer.new(:black)
  game = Chess.new(p1, p2).play
end
