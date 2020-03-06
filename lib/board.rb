require 'pry'
class Board
  
  attr_accessor :cells
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
      unless @cells == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end
  end

  def position(input)
    @cells[input.to_i- 1]
  end
  
  def full?
    @cells.all?{|square| square != " " }
  end
  
  def turn_count
    @cells.count{|square| square != " " }
  end
  
  def taken?(input)
    @cells[input.to_i- 1] != " "
  end
  
  def valid_move?(input)
    !taken?(input) && input.to_i > 0 && input.to_i <= 8 
  end
  
  def update(input, player)
    @cells[input.to_i- 1] = player.token 
  end
  
  
end