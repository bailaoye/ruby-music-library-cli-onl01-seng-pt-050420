class MusicImporter
  attr_accessor :filepath, :song, :artist, :genre
  def initialize(filepath)
    @filepath = filepath
  end

  def files
    Dir.entries(@filepath).select! {|entry| entry.end_with?(".mp3")}
  end

end
