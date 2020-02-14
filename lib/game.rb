require 'pry'
class Game
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    attr_accessor :board, :player_1, :player_2
    def initialize(player1 = Players::Human.new("X"), player2=Players::Human.new("O"), board = Board.new)
        @player_1 = player1
        @player_2 = player2
        @board = board
        @board.display
    end

    def current_player
        turn_num = @board.turn_count
        if turn_num % 2 == 0
            @player_1
        else
            @player_2
        end
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
          if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0] + 1) 
             return combo
          end
        end
        false
    end
    
    def draw?
        @board.full? == true && won? == false
    end

    def over?
        draw? || won? 
    end

    def winner
        # binding.pry
        if won?
            winning_combo = won?
            @board.cells[winning_combo[0]]
        end  
    end

    def turn
        puts "Please enter a number (1-9):"
        index = current_player.move(@board)
        if @board.valid_move?(index)
            @board.update(index, current_player)
        else
            puts "Please enter a valid number (1-9)"
            @board.display
            turn
        end
        @board.display
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