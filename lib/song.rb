class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end


  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    found_song  = self.find_by_name(name)
    if (found_song)
      return found_song
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename_split = filename.split(" - ")
    artist_name = filename_split[0]
    name = filename_split[1][0...-4]
    song = new_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    filename_split = filename.split(" - ")
    artist_name = filename_split[0]
    name = filename_split[1][0...-4]
    song = create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
  
end
