module Players
    class Human < Player
        def move(board)
            puts "enter a move"
            move = gets.strip
            move
        end
    end
  end