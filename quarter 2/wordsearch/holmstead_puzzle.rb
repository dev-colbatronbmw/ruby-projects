############################################################
#
#  Name:              Colby Holmstead
#  Assignment:        final Word search_ puzzle file
#  Assignment Date:   06/10/2019
#  Class:             CIS 283
#  Description:       Ask for user input to create a standard header comment for files
#
############################################################
class HolmsteadPuzzle


  def initialize(row, col, file)

    @row = row
    @col = col
    @file = file
    @words = []
    @letter_array = []
    @ordered_words
    @puz = []
    @used_locations = []

    search_file = File.open(@file, "r")
    until search_file.eof?
      word = search_file.gets.chomp.delete("\s")
      @words << word
    end
    search_file.close

    @ordered_words = @words.sort_by {|word| word.length}.reverse

    @row.times do
      @puz << ("." * @col).split("")
    end
  end


  def get_word(counter)
    # return the words
    words = @ordered_words
    return words[counter]
  end

  def print_words
   return @words.join("\n")
  end

  def ordered_words
    @ordered_words
  end


  def get_word_details(word)
    letter_array = word.upcase.split("")
    word_length = letter_array.length
    return [letter_array, word_length]

  end

  def all_spaces_open?(row, col, direction, letters)

    no = 0
    letters.each do |letter|
      # counter = 0
      # while counter < letters.length
      # puts letters[counter]
      if @puz[row][col] == "." || @puz[row][col] == letter
      else
        no += 1
      end

      case
      when direction == 1 #||  #dir == "north" # north
        row -= 1
        dir = "north"

        if row < 0
          no += 1
        end
      when direction == 2 #|| dir == "north east" # north east
        row -= 1
        col += 1
        dir = "north east"

        if row < 0 || col > @col
          no += 1
        end
      when direction == 3 #||   dir == "east" # east
        col += 1
        dir = "east"
        if  col > @col
          no += 1
        end
      when direction == 4 #|| dir == "south west" # south east
        row += 1
        col += 1
        dir = "south east"
        if  col > @col || row > @row
          no += 1
        end
      when direction == 5 # success
        row += 1
        dir = "south"
        if row > @row
          no += 1
        end
      when direction == 6 #|| dir == "south west" # south west
        row += 1
        col -= 1
        dir = "south west"
        if row > @row || col < 0
          no += 1
        end
      when direction == 7 #||  dir == "west" # west
        col -= 1
        dir = "west"
        if col < 0
          no += 1
        end
      when direction == 8 #|| dir == "north west" # north west
        row -= 1
        col -= 1
        dir = "north west"
        if col < 0 || row < 0
          no += 1
        end
      end

    end

    if no > 0
      answer = "retry"
    else
      answer = "place"
    end
    return answer
  end


  def place_letters(row, col, direction, letters)

    letters.each do |letter|

      @puz[row][col] = letter
      @letter_array << letter
      case

      when direction == 1 #||  #dir == "north" # north
        row -= 1
      when direction == 2 #|| dir == "north east" # north east
        row -= 1
        col += 1
        dir = "north east"
      when direction == 3 #||   dir == "east" # east
        col += 1
        dir = "east"
      when direction == 4 #|| dir == "south west" # south east
        row += 1
        col += 1
        dir = "south east"
      when direction == 5 # success
        row += 1
        dir = "south"
      when direction == 6 #|| dir == "south west" # south west
        row += 1
        col -= 1
        dir = "south west"
      when direction == 7 #||  dir == "west" # west
        col -= 1
        dir = "west"
      when direction == 8 #|| dir == "north west" # north west
        row -= 1
        col -= 1
        dir = "north west"

      end
    end
  end


  def match?(row, col, letter)

    if @puz[row][col] != letter || @puz[row][col] != "."
      return "retry"
    end

  end


  def generate_search_key


    ordered_words.each do |word|

      answer = "retry"
      while answer == "retry"
        start
        row = start[0]
        col = start[1]
        word_length = get_word_details(word)[1]
        letters = get_word_details(word)[0]
        direction = direction(row, col, word_length)

          answer = all_spaces_open?(row, col, direction, letters)
        end


      if answer != "retry"
        place_letters(row, col, direction, letters)
      end
    end
  end


  def generate_puzzle
    letters = @letter_array.flatten
    row_counter = 0
    while row_counter < @row
      col_counter = 0
      while col_counter < @col
        if @puz[row_counter][col_counter] == "."
          @puz[row_counter][col_counter] = letters.sample
        end
        col_counter += 1
      end
      row_counter += 1
    end
  end

  def start
    row = rand(0..@row - 1)
    col = rand(0..@col - 1)
    return [row, col]
  end

  def direction(row, col, word_length)
    if (row + word_length) >= @row
      if (col + word_length) >= @col
        #  "not south and not east"
        selected_direction = [1, 7, 8].sample
      elsif (col + word_length) <= @col && (col - word_length) >= 0
        #  "just not south"
        selected_direction = [1, 2, 3, 7, 8].sample
      elsif (col - word_length) <= 0
        #  "not south west"
        selected_direction = [1, 2, 3].sample
      end

    elsif (row + word_length) <= @row && (row - word_length) >= 0
      if (col + word_length) >= @col
        #  "east not ok"
        selected_direction = [5, 6, 7, 8, 1].sample
      elsif (col + word_length) <= @col && (col - word_length) >= 0
        #  "all ok"
        selected_direction = [1, 2, 3, 4, 5, 6, 7, 8].sample
      elsif (col - word_length) <= 0
        # "west not ok"
        selected_direction = [1, 2, 3, 4, 5].sample
      end

    elsif (row - word_length) <= 0
      if (col + word_length) >= @col
        #  "north east not ok"
        selected_direction = [5, 6, 7].sample
      elsif (col + word_length) <= @col && (col - word_length) >= 0
        # "north not ok"
        selected_direction = [3, 4, 5, 6, 7].sample
      elsif (col - word_length) <= 0
        # "north west not ok"
        selected_direction = [3, 4, 5].sample
      end
    end
    return selected_direction
  end

  def print_puz
    grid = ""
    @puz.each do |row|
      grid += row.join(" ") + "\n"
    end
    return grid
  end



end

