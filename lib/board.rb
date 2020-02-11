class Board
   
    attr_accessor :cells
    def reset!
        @cells =[" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def initialize
        reset!
    end
     
    def display  
        puts "-----------" 
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n"
        puts "-----------" 
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n"
        puts "-----------" 
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n"
        puts "-----------" 
    end

    def position(number)
        position = number.to_i
        position -=1
        @cells[position]
    end

    def update(position, player)
        index = position.to_i 
        index -= 1
        @cells[index] = player.token
    end

    def full?
        if !@cells.include?(" ")
            true
        else    
            false
        end
    end

    def turn_count
        count = 0
        @cells.each do |char|
            if char == "O" || char  == "X"
                count +=1
            end
        end
        count
    end

    def taken?(pos)
        if position(pos) != " "
            true
        else 
            false
        end
    end
        

    def valid_move?(move)
        if move.to_i > 9 || move.to_i < 1 || taken?(move) == true
            false
        else
            true
        end
    end
        



end