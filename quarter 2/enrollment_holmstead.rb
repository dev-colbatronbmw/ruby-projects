############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        Text Search with Regular Expressions
#  Assignment Date:   04/15/2019
#  Class:             CIS 283
#  Description:       Iterate through a file to search out matching classes
#
############################################################

=begin
# (entire two lines as $1 and inside (CIS as $2)(and 282 as $3) )
# just saving work (^\s+\d{4}\s([A-Z]+)\s+(\d+)\s+[A-Z]+\s+[A-Z]+\s+[A-Z]+\s+[A-Z]+\s+[A-Z]+\s+\d.\d\s+\d.\d\s+[a-zA-Z]+\s+[a-zA-Z]+\s+\d+\s+\d+\s+[A-Z]+\s+\w)
# better save (^\d+\s+|^\s+)(\d+)\s+([A-Z]+)\s+(\d+)\s+([A-Z]+)\s+(\D+|\d+\D+)(\d+.\d+|.\d+)\s+(\d+.\d+|.\d+)
# lets try again
# ((^\d+\s+|^\s+)(\d+)\s+([A-Z]+)\s+(\d+))
#
#
# I dont need to capture everything with the regular expression.
# I just need to use the regex to check the start of each line.
# if it matches print those lines until it stops matching
# if there is a completely blank line also stop printing if line == ! ((\S+))
#(^\d+\s+|^\s+)(\d+)\s+([A-Z]+)\s+(\d+) this captures until the class number 4 matches
# !((\S+) might stop at blank line
# maybe put the line into the hash with the key being both the department and the class num
#
#
# psudo code
#
# if =~ department, class == ui_department, ui_class
# print until line == !((\S+)) or department, class != ui_department, ui_class
# do the checks and the prints separately but in the same loop so that it prints the correct line.
#
#
#
# we are searching $2 and $3 for start of printing
#
# can I error search to see if what is entered matches none and have the user retry a valid department and class numbers
#
=end # notes and saves for me including extra credit


=begin
# def count_next_lines(file) todo this is a counter for the number of loops
#   next_line = file
#
#
#   if next_line =~ /^\s+[a-zA-Z]+\s[A-Z]\s+\d{3}/
#
#
#     print "#{next_line}"
#     puts
#
#
#   end
#
#   any_other_lines = file
#
#   if any_other_lines =~ /(^\s+Per|^\s+Class)/
#
#     print "#{any_other_lines}"
#     puts
#   end
#   return next_line
#
# end
=end # work for extra credit not done yet


def check_next_lines(file)
  next_line = file


  if next_line =~ /((^\s+[a-zA-Z]+\s[A-Z]\s+\d{3})|(^\s+Per|^\s+Class))/
    print "#{next_line}"
    puts
  end
  # any_other_lines = file
  #
  # if any_other_lines =~ /(^\s+Per|^\s+Class)/
  #   print "#{any_other_lines}"
  #   puts
  # end

end

print "Please enter Department: "
department = gets.chomp.upcase

until department == "EXIT"

  puts
  print "Please enter Class Number: "
  class_num = gets.chomp.to_i
  enrollment_file = File.open("Enrollment.txt")

  while !enrollment_file.eof?
    line = enrollment_file.gets.chomp
    if line =~ /(^\d+\s+|^\s+)(\d+)\s+#{department}\s+#{class_num}/
      print "#{line}"
      puts

        check_next_lines(enrollment_file.gets.chomp)


    end
  end
  puts
  print "Please enter Department: "
  department = gets.chomp.upcase
end

enrollment_file.close

=begin
# #
# class_hash = {}
#
# enrollment_file = File.open("Enrollment.txt")
#
# print "Please enter Department: "
# department = gets.chomp.upcase
#
# until department == "EXIT"
#
#   puts
#   print "Please enter Class Number: "
#   class_num = gets.chomp.to_i
#
#
#
#
#
#   while !enrollment_file.eof?
#
#
#     line = enrollment_file.gets.chomp
# # puts line =~  /(^\d+\s+|^\s+)(\d+)\s+([A-Z]+)\s+(\d+)/
#
#
#     # if line =~ /(^\d+\s+|^\s+)(\d+)\s+([A-Z]+)\s+(\d+)/
#     if line =~ /(^\d+\s+|^\s+)(\d+)\s+([A-Z]+)\s+(\d+)/
#
#       # puts line
#       class_hash[$3 + $4] = line
#
#
#     end
#
#
#   end
#   p class_hash
#   print class_hash["#{department}#{class_num}"]
#   enrollment_file.close
#
#
#   puts
#   print "Please enter Department: "
#   department = gets.chomp.upcase
#
# end
=end # this was me working toward the extra credit not done with that yet



