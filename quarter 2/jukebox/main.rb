require_relative 'song'
require_relative 'jukebox'


def menu
  return "\n1. Play a song\n2. Show me songs by an artist\n3. Show me song longer than an amount I chose\n4. Add a song\n5. Delete a song\n6. update a song\n7. list all songs (full)\n8. List all songs (short) \n9.Quit"

end

def input_check(user_input, counter)
  while user_input > counter || user_input < 1
    if user_input > counter || user_input < 1
      puts "That is not a valid option"
    end
    user_input = gets.to_i
  end
  return user_input
end

def search_artist(my_jukebox, returned_songs)

  user_search_param = gets.upcase.chomp
  counter = 0

  while counter < my_jukebox.songs.length
    database_search = my_jukebox.songs[counter].artist
    if database_search.upcase.include? user_search_param
      puts my_jukebox.songs[counter]
    end
    counter += 1
  end

end

def search_song_by_length(my_jukebox, user_input, returned_songs)
  puts
  puts "Lets find a song by length\nNumbers only please"
  puts "Enter length in seconds: "
  user_entered_length = gets.to_i
  puts
  while user_entered_length < 1 || user_entered_length > 99999999999999999999999999999999
    puts "that was not a valid entry"
    user_entered_length = gets.to_i
  end

  counter = 0
  puts
  puts "Here are all the songs longer than #{user_entered_length} seconds"
  puts
  while counter < my_jukebox.songs.length
    database_search = my_jukebox.songs[counter].length_in_seconds
    if database_search > user_entered_length
      puts "#{my_jukebox.songs[counter].short_description} #{my_jukebox.songs[counter].length_in_seconds} seconds\n\n"
    end
    counter += 1
  end
end

def show_all(my_jukebox, user_input, returned_songs)
  counter = 0
  while counter < my_jukebox.songs.length
    puts my_jukebox.songs[counter]
    counter += 1
  end

end

def show_all_short(my_jukebox, user_input, returned_songs)
  counter = 0
  while counter < my_jukebox.songs.length
    puts "#{counter + 1}. #{my_jukebox.songs[counter].short_description}"
    counter += 1
  end
end

def select_song(my_jukebox, artist)
  puts
  puts "These are the songs by #{artist}"
  puts
  counter = 0
  song_counter = 0
  song_to_play = []
  current_artist = ""
  while counter < my_jukebox.songs.length
    if current_artist != my_jukebox.songs[counter].title
      if my_jukebox.songs[counter].artist == artist
        song_counter += 1
        song_to_play << "#{my_jukebox.songs[counter].title}"

        puts "#{song_counter} #{ my_jukebox.songs[counter].title}"
      end
    end
    current_artist = my_jukebox.songs[counter].title
    counter += 1
  end
  puts
  puts "Choose a song from above by number: "
  selected_song_num = gets.to_i
  counter = 0
  while counter < my_jukebox.songs.length
    if "#{my_jukebox.songs[counter]}".include?("#{song_to_play[selected_song_num - 1]}") && "#{my_jukebox.songs[counter]}".include?("#{artist}")
      if selected_song_num - 1 > counter || selected_song_num - 1 < 0
        puts "Sorry that is not a valid choice please try again: "
        selected_song_num = gets.to_i
      end
    end
    counter += 1
  end
  counter = 0
  while counter < my_jukebox.songs.length

    if "#{my_jukebox.songs[counter]}".include?("#{song_to_play[selected_song_num - 1]}") && "#{my_jukebox.songs[counter]}".include?("#{artist}")
      return counter.to_i
    end
    counter += 1
  end

end

def delete_song(my_jukebox, returned_songs)
  puts "Ok lets remove a song"
  correct_info = "N"
  until correct_info == "Y" || correct_info ==  "E"
    selected_artist = choose_artists(my_jukebox, returned_songs)
    selected_song = select_song(my_jukebox, selected_artist)
    deleted_song = my_jukebox.songs[selected_song].title
    puts "Are you sure you want to remove\n#{my_jukebox.songs[selected_song].short_description}"
    puts "Enter y for yes and n for no or e to exit with out deleting a song"
    correct_info = gets.chomp.upcase
    until correct_info == "N" || correct_info == "Y" || correct_info == "E"
      puts "Oops y for yes and n for no or e to exit with out deleting a song"
      correct_info = gets.chomp.upcase
    end
    if correct_info == "N"
      puts "Lets try again"
    else correct_info == "Y"
    return selected_song
    puts "#{deleted_song} has been removed"
    end
  end
end

def choose_artists(my_jukebox, returned_songs)
  puts
  counter = 0
  artist_counter = 0
  artist_name = []
  current_artist = ""
  while counter < my_jukebox.songs.length
    if current_artist != my_jukebox.songs[counter].artist
      artist_counter += 1
      artist_name << "#{my_jukebox.songs[counter].artist}"
      puts "#{artist_counter} #{ my_jukebox.songs[counter].artist}"
    end
    current_artist = my_jukebox.songs[counter].artist
    counter += 1
  end
  puts
  puts "Chose an artist from above by number: "
  selected_artist_num = gets.to_i

  input = selected_artist_num
  counter = counter - 1
  selected_artist_num = input_check(input, counter)


  return artist_name[selected_artist_num.to_i - 1]
end

def choose_update_item(new_artist, new_title, new_album, new_year, new_comments, new_length_in_seconds)
# artist


  puts "From the above options\nselect the number for what you want to update: "

  user_choice = gets.to_i

  counter = 6

  user_choice = input_check(user_choice, counter)

  case user_choice
  when 1
    item_update = new_artist
  when 2
    item_update = new_title
  when 3
    item_update = new_album
  when 4
    item_update = new_year
  when 5
    item_update = new_comments
  when 6
    item_update = new_length_in_seconds
  end
  return item_update # todo might be better to return the whole thing as an array
end

def update_string(item_update)

  correct_info = "N"
  until correct_info == "Y"
    puts "Enter details:  "
    new_string = gets.chomp

    puts "Is this correct?\n#{new_string}\n y or n"
    correct_info = gets.chomp.upcase
    until correct_info == "N" || correct_info == "Y"
      puts "Oops y for yes and n for no "
      correct_info = gets.chomp.upcase
    end
    if correct_info == "N"
      puts "Lets try again"
    end

  end
  puts "#{item_update} will be updated to #{new_string}"
  return new_string
end

def add_song(my_jukebox, user_input, returned_songs)

  correct_info = "N"
  puts "lets add a song"
  puts
  until correct_info == "Y"
    puts "Enter artist name: "
    add_artist = gets.chomp
    puts "Enter song title: "
    add_title = gets.chomp
    puts "Enter album name: "
    add_album = gets.chomp
    puts "Enter the album year of release: "
    add_year = gets.to_i
    puts "Add a rating or comments: "
    add_comments = gets.chomp
    puts "Enter the length in seconds: "
    add_length = gets.to_i
    puts "Please verify that the info is correct"
    puts "\nArtist: #{add_artist}\nTitle: #{add_title}\nAlbum: #{add_album}\nYear: #{add_year}\nComments: #{add_comments}\nLength: #{add_length} Seconds\n\n"
    puts "Enter y for yes and n for no "
    correct_info = gets.chomp.upcase
    until correct_info == "N" || correct_info == "Y"
      puts "Oops y for yes and n for no "
      correct_info = gets.chomp.upcase
    end
    if correct_info == "N"
      puts "Lets try again"
    end
  end
  puts "#{add_title} has been added"
  new_song = "#{add_title}\t#{add_artist}\t#{add_album}\t#{add_year}\t#{add_comments}\t#{add_length}"
  return new_song
end

my_jukebox = Jukebox.new
song_file = File.open("songs.txt", "r")
until song_file.eof?
  songs = song_file.gets.chomp.split("\t")
  new_song = Song.new(songs[0], songs[1], songs[2], songs[3].to_i, songs[4], songs[5].to_i)
  my_jukebox.add_song(new_song)
end
song_file.close
puts
puts "Welcome to Jukebox\n\nThe menus all have numbers next to the selections\nyou will need to enter the number corresponding to your choice"
user_input = 0
while user_input < 9
  returned_songs = []
  puts menu
  puts
  puts
  print"Please make a selection: "
  user_input = gets.chomp.to_i
  counter = 9
  user_input = input_check(user_input, counter)
  case user_input
  when 1 #todo clean every ui for method
    puts
    puts "Ok lets play a song, we will first choose an artist"
    artist = choose_artists(my_jukebox, returned_songs)
    selected_song = select_song(my_jukebox, artist)
    puts
    puts my_jukebox.songs[selected_song].play
    puts
  when 2
# todo add an option that lets you just see all
    puts "Would you like artists by list or by entry?\n1. List\n2. Entry"
    user_input = gets.to_i
    if user_input == 1
      artist =  choose_artists(my_jukebox, returned_songs)
      select_song(my_jukebox,artist)
    else
      puts
      puts "Ok all songs from an artist"
      puts "Enter artist name to search:"
      search_artist(my_jukebox, returned_songs)
    end
  when 3
    search_song_by_length(my_jukebox, user_input, returned_songs)
  when 4 
    song_to_add = add_song(my_jukebox, user_input, returned_songs).split("\t")
    new_song = Song.new(song_to_add[0], song_to_add[1], song_to_add[2], song_to_add[3].to_i, song_to_add[4], song_to_add[5].to_i)
    my_jukebox.add_song(new_song)
  when 5
    deleted_song = delete_song(my_jukebox, returned_songs)
    my_jukebox.songs.delete(my_jukebox.songs[deleted_song])
    puts "#{deleted_song} has been removed"
  when 6
    puts "Ok lets pick a song to update\nWe will start by selecting an artist\n\n\n"
    selected_artist = choose_artists(my_jukebox, returned_songs)
    puts "Now chose a song that needs to be updated"
    selected_song = select_song(my_jukebox, selected_artist)
    puts "Here is the current song details"
    puts my_jukebox.songs[selected_song].list
    new_artist = my_jukebox.songs[selected_song].artist
    new_title = my_jukebox.songs[selected_song].title
    new_album = my_jukebox.songs[selected_song].album
    new_year = my_jukebox.songs[selected_song].year
    new_comments = my_jukebox.songs[selected_song].comments
    new_length_in_seconds = my_jukebox.songs[selected_song].length_in_seconds
    user_choice = choose_update_item(new_artist, new_title, new_album, new_year, new_comments, new_length_in_seconds)
    new_string = update_string(user_choice)
    user_choice
    case user_choice
    when new_artist
      new_artist = new_string
    when new_title
      new_title = new_string
    when new_album
      new_album = new_string
    when new_year
      new_year = new_string
    when new_comments
      new_comments = new_string
    when new_length_in_seconds
      new_length_in_seconds = new_string
    end
    my_jukebox.songs[selected_song].update(new_title, new_artist, new_album, new_year, new_comments, new_length_in_seconds)
    puts my_jukebox.songs[selected_song]
  when 7
    show_all(my_jukebox, user_input, returned_songs)
  when 8
    show_all_short(my_jukebox, user_input, returned_songs)
  end
end

puts "Thank you for listening"

song_file = File.open("songs.txt", "w+")
my_jukebox.songs.each do |song|
  song_file.puts "#{song.to_tab}"
end
song_file.close

