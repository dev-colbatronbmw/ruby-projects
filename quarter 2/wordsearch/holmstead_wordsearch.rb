############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        final Word search_ word search file
#  Assignment Date:   06/10/2019
#  Class:             CIS 283
#  Description:       Ask for user input to create a standard header comment for files
#
############################################################


require 'prawn'
require_relative 'holmstead_puzzle'

# my_puz = HolmsteadPuzzle.new(45,45,"words.txt")
my_puz = HolmsteadPuzzle.new(45, 45, "words.txt")


my_puz.generate_search_key
# puts my_puz.print_puz
key = my_puz.print_puz
# puts my_puz.print_words
 words =  my_puz.print_words
my_puz.generate_puzzle
# puts my_puz.print_puz
puzzle = my_puz.print_puz
# puts my_puz.print_words


Prawn::Document.generate("Wordsearch_Puzzle.pdf") do

 font "Courier", :size => 9
 text "Wordsearch", :align => :center, :size => 38
 move_down 5

 text "#{puzzle}", :align => :center
 move_down 20

 text "The following words are hidden in the puzzle above:", :align => :center
 move_down 30

 column_box([50, cursor], :columns => 3, :width => bounds.width, :height => 145) do
  text "#{words}"
 end

 start_new_page

 text "*Key*", :align => :center, :size => 38
 move_down 5


 text "#{key}", :align => :center
 move_down 20

 text "Key Words", :align => :center
 move_down 10

 column_box([50, cursor], :columns => 3, :width => bounds.width, :height => 145) do
  text "#{words}"
 end

end

