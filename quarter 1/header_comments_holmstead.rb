
name = "Colby Holmstead"
assignment = "Header Comment Output"
assignment_date = "01/16/2019"
class_number = "CIS 282"
description = "Ask for user input to create a standard header comment for files"




# this area below is for output
puts "#"* 60
puts "#  "
print "#  "; print"Name:            "; puts name
print "#  "; print"Assignment:      ";puts assignment
print "#  "; print"Date:            ";puts assignment_date
print "#  "; print"Class:           ";puts class_number
# I wanted to show the other way of doing this. I did it the long way
# because I like to keep each piece of data separately change-able
puts "#  Description:     #{description}"
# print "#  ";print"Description:     ";puts description
puts "#  "
puts "#"* 60

#
# todo       Write a Ruby program which will prompt the user for 5 different items:
# todo    	Name
# todo    	Assignment
# todo	    Date
# todo    	Class Number
# todo    	Description


# todo 	    Store each of the above values into an appropriate variable name.


# todo     	Use these variables to print out a formatted Header Comment using the information from the user.
# todo      The header comment should look EXACTLY like the following, down to spacing, alignment, and number of #’s

# First I need to gather the information from the user then I will need to
# output that information in the correct form as shown on instructions.
# first area will be getting the Information (input)
# then I will have a code section for output

# input section of code
# for this area I need to make sure to collect all the pieces of data
puts
puts
puts
puts "Name: "
name = gets.chomp
puts "Assignment: "
assignment = gets.chomp
puts "Date: "
assignment_date = gets.chomp
puts "Class Number: "
class_number = gets.chomp
puts "Enter the assignment description:"
description = gets.chomp




# this area below is for output
puts "#"* 60
puts "#  "
print "#  "; print"Name:            "; puts name
print "#  "; print"Assignment:      ";puts assignment
print "#  "; print"Date:            ";puts assignment_date
print "#  "; print"Class:           ";puts class_number
# I wanted to show the other way of doing this. I did it the long way
# because I like to keep each piece of data separately change-able
puts "#  Description:     #{description}"
# print "#  ";print"Description:     ";puts description
puts "#  "
puts "#"* 60