require './game'

puts "Welcome to the math game! Enter the number of players: "
number = gets.chomp
game = Game.new(number)
game.play_game