require 'pry'
class MP3Importer

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Dir["#{@path}/*.mp3"].collect { |file| file.sub(/.*\/+/, '') }
  end

  def import
    files.each { |file|
      split = file.split(" - ")
      song = Song.new(split[1])
      Artist.find_or_create_by_name(split.first).save
    }
  end
end
