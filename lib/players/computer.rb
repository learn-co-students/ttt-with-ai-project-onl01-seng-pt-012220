module Players
    class Computer < Player
        WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        def move(board)
            WIN_COMBINATIONS.shuffle.each do |combo|
                num1 = combo[0]
                num2 = combo[1]
                num3 = combo[2]
                # binding.pry
                if board.cells[num1] != " " && board.valid_move?(num2 + 1)
                    move_input = num2
                    move_input +=1
                    # puts "cond 1"
                    # enter = gets
                    return move_input.to_s
                elsif board.cells[num2] != " " && board.valid_move?(num3 + 1)
                    move_input = num3
                    move_input +=1
                    # puts "cond 2"
                    # enter = gets
                    return move_input.to_s
                elsif board.cells[num3] != " " && board.valid_move?(num1 + 1)
                    move_input = num1   
                    move_input +=1
                    # puts "cond 3"
                    # enter = gets
                    return move_input.to_s
                elsif board.cells[num1] == " " && board.valid_move?(num2 + 1)
                    move_input = num2
                    move_input +=1
                    # puts "cond 4"
                    # enter = gets
                    return move_input.to_s
                elsif board.cells[num2] == " "  && board.valid_move?(num3 + 1)
                    move_input = num3
                    move_input +=1
                    # puts "cond 5"
                    # enter = gets
                    return move_input.to_s
                elsif board.cells[num3] == " "  && board.valid_move?(num1 + 1)
                    move_input = num1   
                    move_input +=1
                    return move_input.to_s
                else
                    count = 0
                    board.cells.each do |cell_a, cell_b|
                        if cell_a == " " && cell_b != @token
                            move_input = count + 1
                            return move_input.to_s
                        else
                            count +=1
                        end
                    end
                end
            end 
        end           
    end     
end
