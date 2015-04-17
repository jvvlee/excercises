# The exciting World Cup 2010's summer is coming! And Johnny's family shop is busy preparing a colorful lighting board for the summer.
# The board has a rectangular shape of size M x N. There are certain positions on the board which Johnny wants to put in light bulbs.
# Johnny wants to decorate the board by colorful light bulbs. To make the board look attractive, he wants the bulbs in the same column or row to have different colors! On the other hand, to preserve the harmony look, Johnny doesn't want the bulbs to have many different colors.
# Write a program to help Johnny decorate the boards in such a way that the number of color used is minimum.
# Input

# The first line contains a number t (about 15), the number of test cases. Each test case has the following form.
# The first line contains two numbers m, n (1 ≤ m, n ≤ 700). Each line in the next m lines contains n characters
# '0' or '1' representing the board, in which '1' denotes a place which Johnny wants to put in a light bulb.
# Each test case's input is separated by a blank line.
# Output

# For each test case, print the output in the following format.
# The first line contains a number p which is the minimum number of used colors.
# The ith line in the next m lines contain n integers, in which the jth number is the color index of the light bulb in the corresponding place, or 0 if the place does not need a light bulb. The colors are numbered from 1 to p. Your program can print any correct solution.
# Print a blank line after each test case's output.
# Example

# Input
# 1

# 4 4
# 1001
# 1101 
# 1011
# 1001

# Output
# 4
# 1 0 0 2 
# 2 1 0 3 
# 3 0 1 4 
# 4 0 0 1
# 
# 10101
# 00111
# 00111
# 
# 10203
# 00312
# 00

#This seems like a more difficult version of the 8 queens problem. Unlike that problem, this board is dynamic and there is more to consider than "queens"...
#Think of it like a Sudoku solver. The first approach is to brute force-it, but I'll want to find the least amount of numbers as possible. What conclusions can I state before doing 
#anything?
#
# The minimum number of colors I can use is always the row/column with the most lightbulbs.
# After that, just make sure that there's no intersection. Implement it, then see it works, then optimize after
# I think my approach would be to see if I want to manipulate by vertical or horizontal fill in, and then work from there.

require_relative 'LightsPattern.rb'

puts "How many cases need to be tested?"
tests = gets.chomp
iteration = 1

patterns = []

until iteration == tests
  puts "What are the dimensions of pattern #{iteration}?"
  dimensions = gets.chomp

  puts "Enter #{dimensions[1]} lines of patterns"

  matrix = []
  (1..dimensions[1]).each do |row_num|
    matrix.push(gets.chomp) #do no checking of length, will make user friendly later
  end
  
  patterns.push(LightsPattern.new(matrix))
end