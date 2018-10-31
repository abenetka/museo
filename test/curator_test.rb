require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/photograph'
require './lib/artist'
require 'pry'

class CuratorTest < Minitest::Test
  def test_it_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_it_starts_with_no_artists_and_photographs
    curator = Curator.new
    assert_equal [], curator.artists
    assert_equal [], curator.photographs
  end

  def test_it_can_add_photographs
    curator = Curator.new
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    new_photo1 = curator.add_photograph(photo_1)
    new_photo2 = curator.add_photograph(photo_2)
    #
    # new_photo1 = Photograph.new(photo_1)
    # new_photo2 = Photograph.new(photo_2)

    expected = [new_photo1, new_photo2]

    assert_equal expected, curator.photographs
  end

  def test_it_can_look_at_attributes_of_photograph
    curator = Curator.new
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    new_photo1 = curator.add_photograph(photo_1)
    new_photo2 = curator.add_photograph(photo_2)

    assert_equal new_photo1, curator.photographs.first
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name
  end






end
