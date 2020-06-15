class MusicImporter
  attr_accessor :filepath, :song, :artist, :genre
  def initialize(filepath)
    @path = path
  end

  def files
    Dir.entries(@path).select! {|entry| entry.end_with?(".mp3")}
  end
end
