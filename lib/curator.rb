class Curator

attr_reader :artists, :photographs
  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    # binding.pry
    curator_photo = Photograph.new(photo)
    @photographs << curator_photo
    curator_photo
  end

  def add_artist(artist)
    curator_artist = Artist.new(artist)
    @artists << curator_artist
    curator_artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photograph|
      photograph.id == id
    end
  end





end
