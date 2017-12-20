require 'pry'

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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song = Song.new
    song.name = song_array[1].to_s.slice!(0..-5)
    song.artist_name = song_array[0].to_s
    song
  end

  def self.create_from_filename(filename)
    song_array = filename.split(" - ")
    song = Song.new
    song.name = song_array[1].to_s.slice!(0..-5)
    song.artist_name = song_array[0].to_s
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
