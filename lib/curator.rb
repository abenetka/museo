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

  def find_photographs_by_artist(artist)
    artist_id = artist.id
    @photographs.find_all do |photograph|
      photograph.artist_id == artist_id
    end
  end

  def artists_with_multiple_photographs
    artist_ids = @photographs.map do |photograph|
      photograph.artist_id
    end
    duplicate = artist_ids.detect do |id|
      artist_ids.count(id) > 1
    end
    [find_artist_by_id(duplicate)]
  end

  def photographs_taken_by_artists_from(country)
    @artists.find_all do |artist|
      artist.country == country
    end
  end





end
