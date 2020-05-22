class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @board.display
  end
 
  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end
  
  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      puts "That is not a valid move."
      @board.display
      turn
    end
  end
  
  def won?
    win_combo = false
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|space| @board.cells[space] == "X"}
        win_combo = combo
      elsif combo.all? {|space| @board.cells[space] == "O"}
        win_combo = combo
      end
    end
    win_combo
  end
  
  def draw?
    @board.full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    won? ? @board.cells[won?[0]] : nil
  end
  
  def play
    turn until over?
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end