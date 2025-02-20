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
    song = self.new
    song.save
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
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|s| s.name}
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_name = song_array[1].to_s.slice!(0..-5)
    artist_name = song_array[0].to_s

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song_array = filename.split(" - ")
    song_name = song_array[1].to_s.slice!(0..-5)
    artist_name = song_array[0].to_s

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
