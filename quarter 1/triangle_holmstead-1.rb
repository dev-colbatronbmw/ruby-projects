############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        Right Triangle
#  Assignment Date:   01/21/2019
#  Class:             CIS 282
#  Description:       use a loop make a right triangle the same height and width as the user input
#
############################################################

# Assignment Details
=begin
# Part 1 -
# 	  Write your algorithm and pseudocode to perform the following code
#
#     Convert the pseudocode into Ruby.
#
#     Read an integer from the user and then draw a
#     right triangle to the screen whose height and width
#     is specified by the number entered.
#
# 	  use a loop to draw the triangle.
#
#     Be sure to handle any number that is input between 0 and N inclusive.
#     account for if the put a neg just ignore the neg
#
# part 2
#
#   Write a second part to the program that will take the same input number and draw a triangle using the numbers like this.
#
#   You will have to use a loop within a loop.
#
#   Input is between 0 and N inclusive.
=end



# NOTES
=begin
# Questions from lecture
# # dont over think
# # no arrays. this is an early assignment
# # its just a pattern
# #
#


#
#

#   this is per line. When a number is entered place one star on the fist line for the first
#  'digit' then space out to the "close digit" at the close digit place another star.
#  the number 1 is entered just place a 1 star.
#  on the last line it needs every digit to be a star in that line.
# Lynn said that there is a pattern to in
# if 1 then just print one star no space
# if 2 then 2 stars no space
# if 3 then 3 stars no space.
# if 4 then 4 stars one space.

# take triangle_size and do math with it to get the height

# print row for number given, print space for row number -2 loop for number given
# user_input = # of loops Spaces = triangle size - 2
# print order per loop
# print "*#{spaces_to_print}*"


# puts user_input
# while user_input < 1
#   print space
#   user_input += 1
# end
# while user_input > row
#
# until row == user_input
#
#   puts star
#
# # column += 1
#   row += 1
# end
# row += 1
# end

# (user_input+1).times do
# # print a start in the first line then use the code to do the spaces
#   print "#{star}#{space}#{star}"
# end
#
# if user_input > 0
#   while user_input
#
#   end
# end
#break it down
# print a row of spaces
# print a row with both
# minus one less then user input
# inner count need to equal

# testing
# row goes up spaces stay at a constant 2 below row number



# need to adds one until number is met

#
# if user_input > 0
#
# # when uI 1 print 1 *
#
#   while user_input > 1 && triangle_rows > user_input
#         puts "**"
#         if user_input > 3
#           puts "***"
#         end
#
#         triangle_rows += 1
#     end
#
#     while triangle_rows < user_input
# spaces = " "
# puts "*#{spaces}*"
# # when uI > 3 print start then # of spaces then end start until on less than uI
# triangle_rows += 1
#
#     end
#
#
#
#
#
#
#
#
#
#     # if the loop need to exit print last line of stars
#    while triangle_rows < user_input do
#       # Last Line of stars on triangle
#       # if the loop need to exit print last line of stars
#         if user_input > 1
#           print "*"
#         end
#    triangle_rows += 1
#    end
#   end

# take user input
# start rows at 0
# at 0 nothing
# at 1 *
# at 2 **
# at 3 ***
#
#
#
#
# # at 0 nothing
# # at 1 *
# # at 2 **
# # at 3 * *
# # at 4 *  *
# # at 5 *   *
# # at 6 *    *
# # at 7 *     *
# # at 8 ********


=end




# part 1
# pseudocode
=begin
ask for user input user input
start rows at 0
if user input is less than on do nothing 
elsif user input 1 show one star
else put top star
count the user input and -2 to ger number of spaces
while the rows are less than the input from user loop
dont forget to add to row
after print a row of stars matching the user input




if the loop need to exit print last line of stars
=end


# ask for user input of a number
puts "Please help me draw a Triangle!"
print "Please Enter a number for the size of the Triangle: "
user_input = gets.to_i
# rows should = the number of user input in the end
#user input is the height and width

# I needed to declare this variable to help my brain with
# the math
star = "*"


puts "part 1"
puts

if user_input < 1
elsif user_input == 1
  print star
else
  triangle_rows = 0
  puts star
  while triangle_rows < user_input - 2
    puts star + " "*triangle_rows + star
    triangle_rows += 1
  end
  puts star * user_input
end


# spacing out for visualisation
puts
puts


# part 2
# pseudocode
=begin
todo I had a hard time with this one I used code
todo from the lecture to get to get where I did some variables I did not change
use a nested loop to count the number of rows and print a count from
1 to that row number on its respective row

if less than one do nothing
if one print 1
else set row count at 0
while rows are less than or = to the user input set inner counter
while inner counter is less than or = triangle rows print the inner counter
add 1 to inner counter
then out side that add one to the rows so that it is not an infinate loop

=end

 puts "part 2"
if user_input < 1
elsif user_input ==1
  print "1"
else user_input > 1
triangle_rows = 1
while triangle_rows <= user_input
 puts
  inner_count = 1
while inner_count <= triangle_rows
  print "#{inner_count}"
  inner_count += 1
end
  # puts
  triangle_rows += 1


end
end

puts
puts

# Extra cred

puts "Extra credit attempt"
puts
# + to user input - 2
# each loop reduce the number by one
# if this is not done Ignore
# still working

if user_input < 1
elsif user_input == 1
  print star
else
  triangle_rows = 0
  puts " " * (user_input - 1) + star
  while triangle_rows < user_input - 2
    puts " " * (user_input - 1) +
    star + " "*triangle_rows + star
    triangle_rows += 1
  end
  puts star * user_input

end
puts
puts


if user_input < 1
elsif user_input == 1
  print star
else
  triangle_rows = 0
  puts star
  while triangle_rows < user_input - 2
    puts star+ " "*triangle_rows + star
    triangle_rows += 1
  end
  puts star * user_input
end