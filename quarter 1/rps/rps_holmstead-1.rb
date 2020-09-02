############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        Rock Paper scissors
#  Assignment Date:   01/21/2019
#  Class:             CIS 282
#  Description:       Make a Rock, Paper, Scissors that a user can play against the computer
#
############################################################


#Pseudocode
=begin

start by explaining the game to the user.
--see if user wants to play the game
declare score store score in a variable
declare 2 hashes
wins ties loses
--while Y then play the game if N then run closing code or "else" when
game end read the score then reset the score
on yes computer chooses random number between 1 and 3
I will need to tun the computer number into a string to pull the correct hash.
When the user enters their number get it to_i to error check then convert it
to a string for the hash
combine the two stings into one and have that be the key for the hash
use that key to choose the value from both hashes one for the score counter
and the other for the output to the user this way I will only need one if statement
use the output on the output table to add the value to the score.
use the key to output the response from the response table value

-- store new score

-- add one to the number of times played. this is for determining the final output after user enters
n to not play. if player never played then I will not output any score.

-- ask if they want to play again
run the same error check that we used to start the game this time to loop it.
-- if no output score totals for this round.
    reset score to 0 all then exit
1=rock
2=paper
3=scissors
hash definition table
user is always digit 1
comp is digit 2
11 = tie
12 = lose
13 = win
21 = win
22 = tie
23 = lose
31 = lose
32 = win
33 = tie

=end


# declare global variables and Hash here
outcome_table = {
    11 => "Tie",
    12 => "Lost",
    13 => "Win",
    21 => "Win",
    22 => "Tie",
    23 => "Lost",
    31 => "Lost",
    32 => "Win",
    33 => "Tie"
}

round_response_table = {
    11 => "Its a TIE! Great minds think alike",
    12 => "You chose Rock I chose Paper you LOSE!",
    13 => "You chose Rock that beats Scissors you WIN!",
    21 => "Your Paper beats my Rock you WIN!",
    22 => "Its a TIE! You are a mind reader",
    23 => "My scissors beats your paper you LOSE!",
    31 => "My Rock smashes your Scissors you LOSE!",
    32 => "Scissors cuts up Paper you WIN!",
    33 => "Its a TIE! Great minds think alike"
}

wins = 0
loses = 0
ties = 0


puts "Want to play Rock, Paper, Scissors?"
puts "
    Here is the rules
    When played between two people,
    each person picks one of the three options
    (usually shown by a hand gesture) at the same time,
    and a winner is determined.

    In the game,
    Rock beats Scissors,
    Scissors beats Paper,
    Paper beats Rock
"
puts
print "Please Enter 'Y' for Yes and 'N' for No: "
user_becomes_player = gets.chomp.upcase


play_count = 1

until user_becomes_player == "Y" || user_becomes_player == "N"
  puts "oops-- Please Enter 'Y' for Yes and 'N' for No: "
  user_becomes_player = gets.chomp.upcase
end

if user_becomes_player == "Y" # game start


  while user_becomes_player == "Y"
    if play_count == 1
      puts
      puts "OKAY Sounds like fun!"
    else
      puts " Im in lets keep going!"
    end


# computers choice is random between 1-3
    computer_choice = rand (1..3)
    computer_choice.to_s
# puts computer_choice # todo remove for final game

# player makes a choice in the game
    puts
    print " 1 for Rock
 2 for Paper
 3 for Scissors
 Enter your choice: "

    player_choice = gets.to_i

# todo error check if the player enter 1,2, or 3 then run game
# else ask for choice again
# needs to loop if not a correct answer
# while player_choice not 1,2, or 3 loop
# print " That's not how to play
#  1 for Rock
#  2 for Paper
#  3 for Scissors
#  Enter your choice: "
# end loop when answer is a 1,2, or 3

    while player_choice > 3 || player_choice < 1
      print " That's not how to play
       1 for Rock
       2 for Paper
       3 for Scissors
       Enter your choice: "
      player_choice = gets.to_i
    end
# puts player_choice


# calculate outcome hash key here while everything is a string
    player_choice = player_choice.to_s
    round_outcome = "#{player_choice}#{computer_choice}"
# puts round_outcome
    round_outcome = round_outcome.to_i
    puts

# find outcome of round
# add the score to current totals.
# puts current score for player
# use outcome table hash so pull result
# puts "round outcome #{round_outcome}"
    puts

    round_score = outcome_table[round_outcome]

    puts round_response_table[round_outcome]


    if round_score == "Win"
      wins += 1
    elsif round_score == "Lost"
      loses += 1
    else # tie
      ties += 1
    end


# put  out the total scores here
# wins:
# loses:
# Ties:
    puts
    puts "Your score
 #{wins}: Wins
 #{loses}: Loses
 #{ties}: Ties"


    play_count += 1


    puts
    puts
    puts "Want to play again?"
    print "Please Enter 'Y' for Yes and 'N' for No: "
    user_becomes_player = gets.chomp.upcase


    until user_becomes_player == "Y" || user_becomes_player == "N"
      puts "oops-- Please Enter 'Y' for Yes and 'N' for No: "
      user_becomes_player = gets.chomp.upcase
    end


  end

end

if play_count > 1
# display scores
  puts
  puts
  puts "Thank you for playing, you won #{wins} times, lost #{loses}, and we tied #{ties} times"
  puts
  puts "Goodbey!"

else
  play_count < 1
# display scores
  puts
  puts
  puts "That's too bad! Goodbey!"

end