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
      binding.pry
      Artist.new(split.first).save
    }
  end
end
