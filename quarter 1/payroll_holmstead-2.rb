############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        Payroll
#  Assignment Date:   01/21/2019
#  Class:             CIS 282
#  Description:       Calculate Payroll for Employees
#
############################################################

=begin

To do:
	Write a Ruby program which prompts the user for the following information and store
    in appropriate variables:
	Employee’s Name
	Number of hours worked in a week (could be whole number or decimal)
	Hourly pay rate (could be whole number or decimal)
	Federal Tax withholding rate (%)
	State tax withholding rate (%)

The output of the program will then calculate and print out a report as follows.
 Do not worry about rounding to 2 decimal places. Assume the user does not enter % or $

Plan on how to display the withholding rate % in its different formats as shown below.

=end
# Psuedocode - get the hours and and then times it by the pay rate. once you have the pay rate times that
# by the % of tax to get deductions. to get % of tax make sure to if its above 1 to convert to a decimal
# to convert divide by 100. if its a decimal convert back to whole number to display fro the output.

#start with gathering the data needed.
# name is string
puts "Enter Employee's Name: "
employee_name = gets.chomp
# hours needs to be a float for decimals
puts "Enter number of hours worked in a week: "
  hours = gets.to_f
# pay rate needs to be a float for decimals
puts "Enter hourly pay rate: "
  pay_rate = gets.to_f
# both taxes needs to be a float for decimals
puts "Enter federal tax withholding rate: "
  federal_tax = gets.to_f
#Convert the input to the proper % number
# Psuedocode-- if the number is a decimal then dont change if the number is a whole
# number convert to decimal for calculations
if federal_tax > 1
   federal_tax_calc = (federal_tax/100)
   federal_tax_shown = federal_tax
  elsif federal_tax < 1
        federal_tax_calc = federal_tax
        federal_tax_shown = (federal_tax*100)
else puts "Error at federal Tax Calculation"
end


puts "Enter state tax withholding rate: "
state_tax = gets.to_f
#Convert the input to the proper % number
if state_tax > 1
   state_tax_calc = (state_tax/100)
   state_tax_shown = state_tax
elsif state_tax < 1
      state_tax_calc = state_tax
      state_tax_shown = (state_tax*100)
else puts "Error at state Tax Calculation"
end

# find the total pay before taxes then deduct for Gross pay

gross_pay = (hours * pay_rate)


# get the deducted amount for each tax and store them - amount should = tax rate times grass pay
federal_tax_amount = federal_tax_calc * gross_pay

state_tax_amount = state_tax_calc * gross_pay
# total deductions
total_deductions = federal_tax_amount+state_tax_amount
# net pay calculation is gross pay minus deductions
net_pay = gross_pay-total_deductions



puts "Employee Name: #{employee_name}"
puts "Hours Worked:  #{hours}"
puts "Pay Rate:      $#{pay_rate}"
puts "Gross Pay      $#{gross_pay}"
puts "Deductions:"
puts "    federal Withholding (#{federal_tax_shown}%): $#{federal_tax_amount}"
puts "    State Withholding (#{state_tax_shown}%): $#{state_tax_amount}"
 # sum of the two withheld amounts will be the total
puts "    Total Deduction: $#{total_deductions}"
puts " Net Pay: $#{net_pay}"


