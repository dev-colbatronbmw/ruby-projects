#############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        Midterm Quiz
#  Assignment Date:   02/06/2019
#  Class:             CIS 282
#  Description:       Correct the Code so it looks and runs correctly
#
############################################################
#
#
#
#
# Program to show the smallest number in an array
# Lets user view the array, add a new number and show smallest number in the array
#
# INDENT and REFORMAT code as appropriate to COURSE standards ( DAVE STANDARD CODING - DSC ).
# Debug and fix the code so that it works correctly.
# Print out the final copy and turn it in with your NAME on it.
#

numbers = [100, 20, 30, 40, 80]

menu_selection = ""




while menu_selection != 4 do
  puts "1 Show All Numbers"
  puts "2 Add a Number"
  puts "3 Show Smallest Number"
  puts "4 Exit Program"
  puts
  puts "Enter a selection: "
  menu_selection = gets.to_i

  # check for errors
  until menu_selection >= 1 && menu_selection <= 4
    puts "That was not an available selection."
    puts "Please try again."
    puts "1 Show All Numbers"
    puts "2 Add a Number"
    puts "3 Show Smallest Number"
    puts "4 Exit Program"
    puts
    puts "Enter a selection: "
    menu_selection = gets.to_i
  end


  if menu_selection == 1 then
    numbers.each {|n| puts n}
    puts
    print "Press enter to continue"
    pause = gets
    puts
  elsif menu_selection == 2 then
    puts "Enter a new number: "
    numbers[numbers.length] = gets.chomp.to_i
    numbers.sort! # this was just for my sanity
    puts
    print "Press enter to continue"
    pause = gets
    puts
  elsif menu_selection == 3 then
    index = 0
    smallest = numbers.min
    puts "Smallest number is: #{ smallest }"
    puts
    print "Press enter to continue"
    pause = gets
    puts
  else
  end
end
puts "Goodbye"