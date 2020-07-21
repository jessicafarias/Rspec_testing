#!/usr/bin/env ruby

require 'colorize'
require_relative '../lib/user.rb'
require_relative '../lib/board.rb'



puts '*********************************'.red
puts '****'.red + '      TIC TAC TOE        ' + '****'.red
puts '*********************************'.red
user = []
board = Board.new

puts board.winner([[1,2,3],["X","X","X"],[7, 8, 9]])
2.times do |i|
  print "User #{i + 1}: Please write your name: "
  name = gets.chomp
  user << User.new(board.symbols[i], name)
  puts "Welcome #{user[i].name.yellow}. your symbol is #{user[i].symb.yellow}."
end

puts board.display

while board.counter.positive?
  puts "It's your turn #{user[board.current].name.yellow}!"
  print "Please select the number of an empty box to put an #{user[board.current].symb.yellow}:"
  selected_number = gets.chomp.to_i

  puts "\n***********************************"
  puts 'Invalid choice, Try again!'.red unless board.turn(user[board.current].symb, selected_number)
  puts '***********************************'
  puts board.display
end

if board.symb == ''
  puts "It's a DRAW".green
else
  puts board.symb.green + '!!!!'.green
  i = user.index { |x| x.symb == board.symb }
  puts "#{user[i].name} is the WINNER".green
end


puts board.winner([[1,2,3],["X","X","X"],[7, 8, 9]])