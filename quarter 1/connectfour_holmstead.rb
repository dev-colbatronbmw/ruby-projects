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


print_grid(board)


game = "continue"


while game != "over"

# start place token
  puts "enter col :"
  token_placement = gets.chomp.to_i - 1
  error =  "Oops #{token_placement + 1} was not a open or valid spot to play\nYou must play in an empty column between 1 and 8\nPlease Try Again: "
  token_placement  = out_of_bounds?(board, token_placement, error)
  token_placement = full_col?(board, token_placement, error)

  # token_placement = rand(0..7) #todo make extra cred
  User_token_placement(board, token_placement, "X")



  win = check_for_win(board, token_placement, "X")

  print_grid(board)

  if win == 1
    puts "X win"
    game = "over"
  end


  if game != "over"


    token_placement = rand(0..7)

    token_placement  = computer_out_of_bounds?(board, token_placement, error)
    token_placement = computer_full_col?(board, token_placement, error)

    comp_token_placement(board, token_placement, "O")

    win = check_for_win(board, token_placement, "O")

    print_grid(board)

    if win == 1
      puts "O win"
      game = "over"
    end



  end
end