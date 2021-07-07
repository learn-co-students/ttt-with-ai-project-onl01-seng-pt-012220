
#!/usr/bin/env ruby
require_relative '../config/environment'

def game_start
  puts "\nWelcome to Command Line Tic Tac Toe!"
  puts "\nWhat kind of game will you like to play? Please choose player mode:
  0 - Computer VS Computer
  1 - You VS Computer
  2 - You VS Your friend"

  player_mode = gets.strip

  if player_mode == "1"
    puts "Do you want to go first? [y/ n]"
    if gets.strip == "y"
      Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
    else   Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
    end

  elsif player_mode == "0"
    Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play

  elsif player_mode == "2"
    Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
  end
  puts "Would like to play again? [y/ n]"

end

game_start until gets.strip == "n"