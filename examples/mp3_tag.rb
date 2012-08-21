#!/usr/local/bin/ruby

# Ruby script to update all mp3 ID3 tags with data gleaned from the directory structure and file name
# The directory structure is as follows:
#   <genre>/<artist>/<album>/<track>.mp3
# Mp3 files can also appear in any of the parent folders, in which case "Misc" is used for other fields.
# by Toby Kurien

require "ftools"
require "mp3info"

# The root directory where the music is stored. The first-level sub-folders are the genre
@rootDir = "/home/toby/Music";

# check if the path is a valid directory
def valid_dir?(path)
  valid = File.directory?(path)
  valid = valid && path.split("/").last() != "."
  valid = valid && path.split("/").last() != ".."
end

# check if the file is an mp3
def mp3?(filename)
  File.extname(filename) == ".mp3"
end

# update an mp3 tag using supplied information
def song(genre, artist, album, song)
  puts("#{genre}: #{artist} - #{album} / #{song}")
  path = @rootDir
  path += "/" + genre if genre != nil
  path += "/" + artist if artist != nil
  path += "/" + album if album != nil
  path += "/" + song
  
  genre = "Misc" if genre == nil
  artist = genre + " Misc" if artist == nil
  album = artist + " Misc" if album == nil
  title = File.basename(song, ".mp3")
  
  Mp3Info.open(path) do |mp3|
      mp3.tag.genre = 255
      mp3.tag.artist = artist
      mp3.tag.album = album
      mp3.tag.title = title
      
      mp3.tag2.TCON = genre
      mp3.tag2.TPE1 = artist
      mp3.tag2.TALB = album
      mp3.tag2.TIT2 = title
    end
end

# process an album folder containing tracks
def album(genre, artist, album)
  Dir.open("#{@rootDir}/#{genre}/#{artist}/#{album}").each() do |filename|
    if valid_dir?("#{@rootDir}/#{genre}/#{artist}/#{album}/#{filename}")
      album(genre, artist, album + "/" + filename)
    end
    song(genre, artist, album, filename) if mp3?(filename)
  end
end

# process an artist folder containing albums
def artist(genre, artist) 
  Dir.open("#{@rootDir}/#{genre}/#{artist}").each() do |filename|
    album(genre, artist, filename) if valid_dir?("#{@rootDir}/#{genre}/#{artist}/#{filename}");
    song(genre, artist, nil, filename) if mp3?(filename)
  end
end

# process a genre folder containing artists
def genre(genre)
  Dir.open("#{@rootDir}/#{genre}").each() do |filename|
    artist(genre, filename) if valid_dir?("#{@rootDir}/#{genre}/#{filename}");
    song(genre, nil, nil, filename) if mp3?(filename)
  end
end

# display mp3 tag information - used for debugging
def show_mp3_info(mp3)
  Mp3Info.open(mp3) do |mp3info|
    puts mp3info
  end
end

# do it
Dir.open(@rootDir).each() do |filename|
  genre(filename) if valid_dir?("#{@rootDir}/#{filename}");
end
