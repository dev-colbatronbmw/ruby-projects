def User_token_placement(board, token_placement, token)
  row = 7
  while row > -1
    if board[row][token_placement] == "."
      board[row][token_placement] = token
      row = 0
    end
    row -= 1
  end
end


def out_of_bounds?(board, token_placement, error)

  while token_placement < 0 || token_placement > 7
    print_grid(board)

    puts error

    token_placement = gets.chomp.to_i - 1
  end
  return token_placement
end

def full_col?(board, token_placement, error)

  user_col_counter = 0
  row_check = 0
  while row_check < board.size
    if board[row_check][token_placement] != "."
      user_col_counter += 1
      while user_col_counter == 8
        print_grid(board)
        puts error
        token_placement = gets.chomp.to_i - 1

        if board[row_check][token_placement] == "."
          user_col_counter = 0
        end
      end
    end
    row_check += 1
  end
  return token_placement

end

def computer_out_of_bounds?(board, token_placement, error)

  while token_placement < 0 || token_placement > 7


    token_placement = rand(0..7)
  end
  return token_placement
end

def computer_full_col?(board, token_placement, error)

  user_col_counter = 0
  row_check = 0
  while row_check < board.size
    if board[row_check][token_placement] != "."
      user_col_counter += 1
      while user_col_counter == 8

        token_placement = rand(0..7)

        if board[row_check][token_placement] == "."
          user_col_counter = 0
        end
      end
    end
    row_check += 1
  end
  return token_placement

end


def comp_token_placement(board, token_placement, token)
  row = 7
  while row != -1
    if board[row][token_placement] == "."
      board[row][token_placement] = token
      row = 0
    end
    row -= 1
  end
end

def check_for_win(board, token_placement, token)
  # start Row check
  win = 0
  game = "continue"
  row = 7
  row_check = 0
  board[row].each do |value|
    if value == token
      row_check += 1
      if row_check == 4
        win += 1
        game = "over"
      end
    elsif value != token
      row_check = 0
    end
  end
#end row check
#
#
#
# start col check
  user_col_counter = 0
  row_check = -1
  while row_check < board.size && game != "over"
    if board[row_check][token_placement] == token
      user_col_counter += 1
      if user_col_counter == 4
        win += 1
        game = "over"
      end
    elsif board[row_check][token_placement] != token
      user_col_counter = 0
    end
    row_check += 1
  end

# end col check
#
#
#
# start \ / Check
  row_check = 0
  while row_check < board.size
    column = 7
    while column > -1
      if board[row_check][column] == token
        if board[row_check - 1][column - 1] == token
          if board[row_check - 2][column - 2] == token
            if board[row_check - 3][column - 3] == token
              win += 1
              game = "over"
            end
          end
        end
        if board[row_check - 1][column + 1] == token
          if board[row_check - 2][column + 2] == token
            if board[row_check - 3][column + 3] == token
              win += 1
              game = "over"
            end
          end
        end
      end
      column -= 1
    end
    row_check += 1
  end # end column checker for user


  return win

end


def print_grid (grid)

  # system('cls') #windows
  system('clear') #mac?

  puts "1 2 3 4 5 6 7 8"
  grid.each do |row|

    puts row.join(" ")

  end
  puts
  sleep 0.5 # seconds
end


def intro(board, example_column, example_row, example_cross_left, example_cross_right)
  system('clear')
  puts
  puts
  puts "Welcome to Connect Four"
  sleep 0.25 # seconds
  puts
  puts "Your goul is to get 4 of your 'X' token in a row"
  sleep 1 # seconds
  puts
  puts "take a look at the ways to win"
  puts
  sleep 2 # seconds
  print_grid(example_column)
  print "You can win in a column"
  sleep 0.5 # seconds
  print_grid(example_row)
  print "You can win in a row"
  sleep 0.5 # seconds
  print_grid(example_cross_left)
  print "You can win in a diagonal"
  sleep 0.5 # seconds
  print_grid(example_cross_right)
  print "You can win in a diagonal either way"
  sleep 0.5 # seconds
  puts
  puts "Want to Play? Y for yes or any key for no: "
  play = gets.chomp.capitalize
  if play == "Y"
    game = "continue"
  elsif play == "N"
    game = "over"
  end
  return game
end

def play_again?
  puts "Want to Play Again? [Y]es or [N]o: "
  play = gets.chomp.capitalize
  if play == "Y"
    game = "continue"
  elsif play == "N"
    game = "over"
    sleep 0.75 # seconds
  end
  return game
end

board = [[".", ".", ".", ".", ".", ".", ".", "."], #row 0
         [".", ".", ".", ".", ".", ".", ".", "."], #row 1
         [".", ".", ".", ".", ".", ".", ".", "."], #row 2
         [".", ".", ".", ".", ".", ".", ".", "."], #row 3
         [".", ".", ".", ".", ".", ".", ".", "."], #row 4
         [".", ".", ".", ".", ".", ".", ".", "."], #row 5
         [".", ".", ".", ".", ".", ".", ".", "."], #row 6
         [".", ".", ".", ".", ".", ".", ".", "."], #row 7
]

example_column = [[".", ".", ".", ".", ".", ".", ".", "."], #row 0
                  [".", ".", ".", ".", ".", ".", ".", "."], #row 1
                  [".", ".", ".", ".", ".", ".", ".", "."], #row 2
                  [".", ".", ".", ".", ".", ".", ".", "."], #row 3
                  [".", ".", ".", "X", ".", ".", ".", "."], #row 4
                  [".", ".", ".", "X", ".", ".", ".", "."], #row 5
                  [".", ".", ".", "X", ".", ".", ".", "."], #row 6
                  [".", ".", ".", "X", ".", ".", ".", "."], #row 7
]

example_row = [[".", ".", ".", ".", ".", ".", ".", "."], #row 0
               [".", ".", ".", ".", ".", ".", ".", "."], #row 1
               [".", ".", ".", ".", ".", ".", ".", "."], #row 2
               [".", ".", ".", ".", ".", ".", ".", "."], #row 3
               [".", ".", ".", ".", ".", ".", ".", "."], #row 4
               [".", ".", ".", ".", ".", ".", ".", "."], #row 5
               [".", ".", ".", ".", ".", ".", ".", "."], #row 6
               [".", ".", "X", "X", "X", "X", ".", "."], #row 7
]

example_cross_left = [[".", ".", ".", ".", ".", ".", ".", "."], #row 0
                      [".", ".", ".", ".", ".", ".", ".", "."], #row 1
                      [".", ".", ".", ".", ".", ".", ".", "."], #row 2
                      [".", ".", ".", ".", ".", ".", ".", "."], #row 3
                      [".", ".", ".", ".", ".", ".", "X", "."], #row 4
                      [".", ".", ".", ".", ".", "X", ".", "."], #row 5
                      [".", ".", ".", ".", "X", ".", ".", "."], #row 6
                      [".", ".", ".", "X", ".", ".", ".", "."], #row 7
]

example_cross_right = [[".", ".", ".", ".", ".", ".", ".", "."], #row 0
                       [".", ".", ".", ".", ".", ".", ".", "."], #row 1
                       [".", ".", ".", ".", ".", ".", ".", "."], #row 2
                       [".", ".", ".", ".", ".", ".", ".", "."], #row 3
                       ["X", ".", ".", ".", ".", ".", ".", "."], #row 4
                       [".", "X", ".", ".", ".", ".", ".", "."], #row 5
                       [".", ".", "X", ".", ".", ".", ".", "."], #row 6
                       [".", ".", ".", "X", ".", ".", ".", "."], #row 7
]


game = intro(board, example_column, example_row, example_cross_left, example_cross_right)


print_grid(board)



while game != "over"

# error check My Methods kept failing A tip would be amazing
  puts "Player 1 You can choose from 1 to 8"
  puts
  token_placement = gets.chomp.to_i - 1
  error = "Oops #{token_placement + 1} was not a open or valid spot to play\nYou must play in an empty column between 1 and 8\nPlease Try Again: "
  token_placement = out_of_bounds?(board, token_placement, error)
  token_placement = full_col?(board, token_placement, error)


  User_token_placement(board, token_placement, "X")


  win = check_for_win(board, token_placement, "X")

  print_grid(board)

  if win == 1
    puts
    puts "Player 1 Has Won"
    puts
    game = "over"
  end


  if game != "over"


    puts "Player 2 You can choose from 1 to 8"
    puts
    token_placement = gets.chomp.to_i - 1
    error = "Oops #{token_placement + 1} was not a open or valid spot to play\nYou must play in an empty column between 1 and 8\nPlease Try Again: "
    token_placement = out_of_bounds?(board, token_placement, error)
    token_placement = full_col?(board, token_placement, error)

    comp_token_placement(board, token_placement, "O")

    win = check_for_win(board, token_placement, "O")

    print_grid(board)

    if win == 1
      puts "Player 2 Wins"
      game = "over"
    end


  end


end


