############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        Histogram
#  Assignment Date:   01/21/2019
#  Class:             CIS 282
#  Description:       makes a graph of numbers in specific ranges
#
############################################################
#
#
#
# To do:
# 	Design and implement an application that creates a histogram that allows
# you to visually inspect the frequency distribution of a set of values.
#
# 	The program should generate 200 random integers in the range 1 through 100 (inclusive)
# and store these into an array.
#
# 	Produce a chart EXACTLY like the one below that indicates how many values fell in the range
# 1 to 10, 11 to 20, and so on. Print one asterisk for each value entered.   Notice the spacing for everything.
#
# find the numbers between 1-10


#methods

# arrays
random_array = Array.new(200) {rand(1..100)}
puts "Range       # Found       Chart \n--------    ----------    ----------------------------------\n\n"

# puts random_array
# variables
first_range_number = 1 ;second_range_number = first_range_number + 9


until second_range_number == 110

  in_range_count = 0

  random_array.each {|i|
    if i >= first_range_number && i <= second_range_number then
      in_range_count += 1 end}

  stars = "*" * in_range_count

  puts "#{first_range_number}".rjust(2) + " -".ljust(1)+"#{second_range_number}".rjust(3) + "       | ".ljust(2) + "#{in_range_count}".rjust(2) + " |       #{stars}"
  first_range_number += 10; second_range_number += 10 # this is a counter for both range numbers.

end


# look and see if its between 1-10

# I need to make a method and call it on each line




