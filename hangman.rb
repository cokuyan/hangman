require './lib/game.rb'
require './lib/human_player.rb'
require './lib/computer_player.rb'

puts "Welcome to Hangman!"
puts "Who will be picking a word?"
puts "A computer or player? (c/p)"
response = gets.chomp
if response == "c"
  chooser = ComputerPlayer.new
else
  chooser = HumanPlayer.new
end

puts "Who will be guessing the word?"
puts "A computer or player? (c/p)"
response = gets.chomp
if response == "c"
  guesser = ComputerPlayer.new
else
  guesser = HumanPlayer.new
end

game = Hangman.new(guesser, chooser)

game.run
