module Players
  
  class Human < Player
    def move(board)
      puts "Please eneter your select 1-9:"
      gets.strip
    end
    
  end
end