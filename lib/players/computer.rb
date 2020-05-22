module Players
  
  class Computer < Player
    
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]  ]
  
    
    def move(board)
      #1) look at first winning WIN_COMBINATIONS
      #2) check if board as 2 non empty and matching token count how many
      #2) a) tru -> move in the empty cell -> return
      #2) b) false check next combination
      #3) No combination was found -> random number
      
      #collects all teh combinations that are close to winning/loosing
      all_combos_with_two_out_of_three = WIN_COMBINATIONS.select {|combo| combo.count {|cell| board.cells[cell] == " "} == 1 && matching_two_out_of_three?(board, combo)}

      #Figures out if one of those combinations has a winning move for computer
      all_combos_with_two_out_of_three.each {|combo|
        #winning move
        if combo.include?(self.token)
          return combo.detect{|cell| board.cells[cell] == " "} + 1
        end
      }
      #in no winning combination block other player
      if !all_combos_with_two_out_of_three.empty?
        return all_combos_with_two_out_of_three[rand(all_combos_with_two_out_of_three.size - 1)].detect{|cell| board.cells[cell] == " "} + 1
      end
    
      rand(8) + 1  #Pick random move if no combintations
    end
  
    def matching_two_out_of_three?(board, combo)
      if board.cells[combo[0]] == board.cells[combo[1]]
        return true 
      elsif board.cells[combo[2]] == board.cells[combo[1]]
        return true 
      elsif board.cells[combo[0]] == board.cells[combo[2]]
        return true 
      end
      false
    end
    
  end #end class
end #end module