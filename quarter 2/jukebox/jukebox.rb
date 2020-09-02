class Jukebox

  attr_reader(:songs)

  def initialize
    @songs = []
  end

  def add_song(new_song)
    @songs << new_song
  end

end