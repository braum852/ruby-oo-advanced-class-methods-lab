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
  song = Song.new ## creates new song
  song.save ##from def save function above
  song
end
##Build a class constructor Song.create that initializes a song and saves it to the 
  ##@@all class variable either literally or through the class method Song.all. 
  ##This method should return the song instance that was initialized and saved.

def self.new_by_name(song_name)
  song = self.new
  song.name = song_name #this line takes string of song and return instance with name set as prop
  song
end
  ##Build a class constructor Song.new_by_name that takes in the string name of a song 
  ##and returns a song instance with that name set as its name property. Song.new_by_name 
  ##should return an instance of Song and not a simple string or anything else.


def self.create_by_name(song_name)
  song = self.create ##This method should return the song instance that was initialized and save
  song.name = song_name ## as above, this line takes string of song and return instance with name set as prop
  song ##returns the instance from argument above
end
##Build a class constructor Song.create_by_name that takes in the string name of a song 
##and returns a song instance with that name set as its name property 
##and the song being saved into the @@all class variable.


def self.find_by_name(song_name)
  self.all.find{|x| x.name == song_name}
end
#Build a class finder Song.find_by_name that accepts the string name of a song 
#and returns the matching instance of the song with that name.

def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name) || self.create_by_name(song_name)
end
##In order to prevent duplicate songs being created that actually represent the same song (based on song name), 
##we're going to build a Song.find_or_create_by_name class method. 
##!This method will accept a string name for a song! and either return a matching song instance with that name 
##or create a new song with the name and return the song instance.

def self.alphabetical
self.all.sort_by{|y| y.name}

end

def self.new_from_filename(filename)
array_input = filename.split(" - ") ##Argument filename separates each array element with " - ", then assigned to a singular variable
artist_name = array_input[0] ##singular variable assigned artist_name as first array [0]
song_name = array_input[1].gsub(".mp3", "") ## second array[1] assigned by song_name, but .mps removed via .gsub method
#diff between gsub and sub is gsub removes ALL elements whereas sub removes only one
##first gsub arg is the pattern to be removed then second arg is what to be replaced by
  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song

end
## Build a class constructor that accepts a filename in the format of "<Artist Name> - <Song Name>.mp3"
##Separate the artist name from the rest of the data based on the - delimiter.
##Don't forget that when you parse the song name, you have to remove the '.mp3' part of the string.

def self.create_from_filename(filename)
array_input = filename.split(" - ")
artist_name = array_input[0]
song_name = array_input[1].gsub(".mp3", "")

  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.destroy_all
  self.all.clear
end
##The Song.destroy_all class method should reset the state of the @@all class variable 
##to an empty array thereby deleting all previous song instances.

end
