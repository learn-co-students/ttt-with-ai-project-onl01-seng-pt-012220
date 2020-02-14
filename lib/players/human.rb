module Players
    class Human < Player
        def move(board = nil)
            user_input = gets.strip
        end
    end
end