class Curator

attr_reader :artists, :photographs
  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    # binding.pry
    new_photo = Photograph.new(photo)
    @photographs << new_photo
    new_photo
  end



end
