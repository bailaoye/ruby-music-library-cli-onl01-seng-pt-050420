class Song
  attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller
  @@all = []
  extend Concerns::Findable

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end


  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    filenames = filename.split(" - ")
    song_name = filenames[1]
    artist_name = filenames[0]
    genre_name = filenames[2].split(".mp3")
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end


end
