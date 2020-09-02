############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        Header Comment Assignment
#  Assignment Date:   01/21/2019
#  Class:             CIS 282
#  Description:       Ask for user input to create a standard header comment for files
#
############################################################


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
puts "Please Enter Your Name: "
name = gets.chomp
puts "What Assignment is this: "
assignment = gets.chomp
puts "What Is Today's Date: "
assignment_date = gets.chomp
puts "Enter Class Number: "
class_number = gets.chomp
puts "Enter the assignment description:"
description = gets.chomp




# this area below is for output
puts "#" * 60
puts "#"
puts "#  Name:              #{name}"
puts "#  Assignment:        #{assignment}"
puts "#  Assignment Date:   #{assignment_date}"
puts "#  Class:             #{class_number}"
puts "#  Description:       #{description}"
puts "#"
puts "#" * 60
