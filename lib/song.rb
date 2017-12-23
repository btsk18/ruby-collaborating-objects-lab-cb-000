require 'pry'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    Song.new(filename.sub(/.*\/+/, '').split(" - ")[1])
  end
end
