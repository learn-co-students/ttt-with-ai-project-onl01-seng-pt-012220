class Board
    attr_accessor :cells

    def initialize
        reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts (" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} ")
        puts ("------------")
        puts (" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} ")
        puts ("------------")
        puts (" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} ")
    end

    def position(cell_number)
        @cells[cell_number.to_i-1]
    end

    def full?
        !@cells.include?(" ")
    end

    def turn_count
        @cells.count{|cell| !cell.include?(" ")}
    end

    def taken?(cell_number)
        !@cells[cell_number.to_i - 1].include?(" ")
    end

    def valid_move?(cell_number)
        (1..9).include?(cell_number.to_i) && !taken?(cell_number)
    end

    def update(cell_number, player)
        @cells[cell_number.to_i - 1] = player.token
    end
end