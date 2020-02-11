class Game
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    attr_accessor :board, :player_1, :player_2
    def initialize(player1 = Players::Human.new("X"), player2=Players::Human.new("O"), board = Board.new)
        @player_1 = player1
        @player_2 = player2
        @board = board
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
        wincombo = []
        WIN_COMBINATIONS.any? do |combo|
          if @board.taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
            wincombo << combo
          end
        end
        if wincombo.length <= 1
            false
        else 
            combo
        end
    end
    



end