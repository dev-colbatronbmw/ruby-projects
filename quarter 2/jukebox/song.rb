class Song
  attr_accessor(:title, :artist, :album, :year, :comments, :length_in_seconds)

  def initialize(title, artist, album, year, comments, length_in_seconds)
    @title = title
    @artist = artist
    @album = album
    @year = year
    @comments = comments
    @length_in_seconds = length_in_seconds
  end


  def play
    return "#{@title} by #{@artist} is playing"
  end

  def short_description
    return "#{@title} by #{@artist} - #{@year}\n"
  end

  def update(new_title, new_artist, new_album, new_year, new_comments, new_length_in_seconds)
    @title = new_title
    @artist = new_artist
    @album = new_album
    @year = new_year
    @comments = new_comments
    @length_in_seconds = new_length_in_seconds
  end

  def to_tab
    return "#{@title}\t#{@artist}\t#{@album}\t#{@year}\t#{@comments}\t#{@length_in_seconds}"
  end

  def list
    return "\n1. Artist: #{@artist}\n2. Title: #{@title}\n3. Album: #{@album}\n4. Year: #{@year}\n5. Comments: #{@comments}\n6. Length: #{@length_in_seconds} Seconds\n\n"
  end

  def to_s
    return "\nArtist: #{@artist}\nTitle: #{@title}\nAlbum: #{@album}\nYear: #{@year}\nComments: #{@comments}\nLength: #{@length_in_seconds} Seconds\n\n"
  end

end