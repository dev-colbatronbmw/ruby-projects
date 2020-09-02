############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        Rock Paper scissors Lizard Spock Extra Credit
#  Assignment Date:   01/21/2019
#  Class:             CIS 282
#  Description:       Make a Rock, Paper, Scissors, lizard, Spock that a user can play against the computer
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



Scissors cuts Paper	Paper covers Rock	Rock crushes Lizard
Lizard poisons Spock	Spock smashes Scissors	Scissors decapitates Lizard
Lizard eats Paper	Paper disproves Spock	Spock vaporizes Rock



=end


# declare global variables and Hash here
outcome_table = {
    11 => "Tie",  #U Rock C Rock
    12 => "Lost", #U Rock C Paper
    13 => "Win",  #U Rock C Scissors
    14 => "Win",  #U Rock C Lizard
    15 => "Lost", #U Rock C Spock
    21 => "Win",  #U Paper C Rock
    22 => "Tie",  #U Paper C Paper
    23 => "Lost", #U Paper C Scissors
    24 => "Lost", #U Paper C Lizard
    25 => "Win",  #U Paper C Spock
    31 => "Lost", #U Scissors C Rock
    32 => "Win",  #U Scissors C Paper
    33 => "Tie",  #U Scissors C Scissors
    34 => "Win",  #U Scissors C Lizard
    35 => "Lost", #U Scissors C Spock
    41 => "Lost", #U Lizard C Rock
    42 => "Win",  #U Lizard C Paper
    43 => "Lost", #U Lizard C Scissors
    44 => "Tie",  #U Lizard C Lizard
    45 => "Win",  #U Lizard C Spock
    51 => "Win",  #U Spock C Rock
    52 => "Lost", #U Spock C Paper
    53 => "Win",  #U Spock C Scissors
    54 => "Lost", #U Spock C Lizard
    55 => "Tie",  #U Spock C Spock
}

round_response_table = {
    11 => "Its a TIE! Great minds think alike",
    12 => "You chose Rock I chose Paper you LOSE!",
    13 => "You chose Rock that beats Scissors you WIN!",
    14 => "You chose Rock and it crushed my Lizard, poor Lizzy.. you WIN",
    15 => "Spock vaporizes your Rock you LOSE",
    21 => "Your Paper beats my Rock you WIN!",
    22 => "Its a TIE! You are a mind reader",
    23 => "My Paper beats your Rock LOSE!",
    24 => "Your Paper has been devoured by my Lizard, you LOSE",
    25 => "You have disproved Spock with your Paper, you WIN",
    31 => "My Rock smashes your Scissors you LOSE!",
    32 => "Scissors cuts up Paper you WIN!",
    33 => "Its a TIE! Great minds think alike",
    34 => "Your Scissors beats my Lizard you WIN",
    35 => "My Spock can crush your Scissors I WIN",
    41 => "My Rock Crushes your tiny Lizard you LOSE",
    42 => "My Paper is no match for your Lizard you WIN",  #U Lizard C Paper
    43 => "I slice the head off your Lizard with me Scissors you LOSE!", #U Lizard C Scissors
    44 => "Its a TIE! You are a mind reader",  #U Lizard C Lizard
    45 => "Your Lizard sneaked up on my Spock and poised him you WIN",  #U Lizard C Spock
    51 => "My Rock could do nothing to your Spock you WIN",  #U Spock C Rock
    52 => "My Paper has evidence that disproves your Spock you LOSE", #U Spock C Paper
    53 => "Your Spock crushed my Scissors you WIN",  #U Spock C Scissors
    54 => "HA! my lizard has poisoned your Spock you LOSE", #U Spock C Lizard
    55 => "Its a TIE! Great minds think alike",  #U Spock C Spock
}

wins = 0
loses = 0
ties = 0


puts "Want to play Rock, Paper, Scissors, lizard, Spock?"
puts "
    Here is the rules
    When played between two people,
    each person picks one of the five options
    (usually shown by a hand gesture) at the same time,
    and a winner is determined.

  In the game,
  Scissors cuts Paper,	Paper covers Rock,	Rock crushes Lizard,
  Lizard poisons Spock,	Spock smashes Scissors,	Scissors decapitates Lizard,
  Lizard eats Paper,	Paper disproves Spock,	Spock vaporizes Rock.

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
    computer_choice = rand (1..5)
    computer_choice.to_s
# puts computer_choice # todo remove for final game

# player makes a choice in the game
    puts
    print " 1 for Rock
 2 for Paper
 3 for Scissors
 4 for Lizard
 5 for Spock
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

    while player_choice > 5 || player_choice < 1
      print " That's not how to play
       1 for Rock
       2 for Paper
       3 for Scissors
       4 for Lizard
       5 for Spock
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