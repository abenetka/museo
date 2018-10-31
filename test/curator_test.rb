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

    curator_photo1 = curator.add_photograph(photo_1)
    curator_photo2 = curator.add_photograph(photo_2)

    expected = [curator_photo1, curator_photo2]

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

    curator_photo1 = curator.add_photograph(photo_1)
    curator_photo2 = curator.add_photograph(photo_2)

    assert_equal curator_photo1, curator.photographs.first
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name
  end

  def test_it_can_add_artists
    curator = Curator.new
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    curator_artist1 = curator.add_artist(artist_1)
    curator_artist2 = curator.add_artist(artist_2)

    assert_equal [curator_artist1, curator_artist2], curator.artists
  end

  def test_it_can_look_at_attributes_of_artist
    curator = Curator.new
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    curator_artist1 = curator.add_artist(artist_1)
    curator_artist2 = curator.add_artist(artist_2)

    assert_equal curator_artist1, curator.artists.first
    assert_equal "Henri Cartier-Bresson", curator.artists.first.name
  end

  def test_it_can_find_an_artist_by_id
    curator = Curator.new
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    curator_artist1 = curator.add_artist(artist_1)
    curator_artist2 = curator.add_artist(artist_2)
    # binding.pry
    assert_equal curator_artist1, curator.find_artist_by_id("1")
  end

  def test_it_can_find_a_photograph_by_id
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

    curator_photo1 = curator.add_photograph(photo_1)
    curator_photo2 = curator.add_photograph(photo_2)
    assert_equal curator_photo2, curator.find_photograph_by_id("2")
  end

  def test_it_can_find_photographs_by_artist
    curator = Curator.new
    photo_1 = {id: "1",name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: "1", year: "1954"}
    photo_2 = {id: "2",name: "Moonrise, Hernandez",artist_id: "2",year: "1941"}
    photo_3 = {id: "3", name: "Identical Twins, Roselle, New Jersey", artist_id: "3", year: "1967"}
    photo_4 = {id: "4", name: "Child with Toy Hand Grenade in Central Park", artist_id: "3", year: "1962"}

    artist_1 = {id: "1", name: "Henri Cartier-Bresson", born: "1908", died: "2004", country: "France"}
    artist_2 = {id: "2", name: "Ansel Adams", born: "1902", died: "1984", country: "United States"}
    artist_3 = {id: "3", name: "Diane Arbus", born: "1923", died: "1971", country: "United States"}

    curator_photo1 = curator.add_photograph(photo_1)
    curator_photo2 = curator.add_photograph(photo_2)
    curator_photo3 = curator.add_photograph(photo_3)
    curator_photo4 = curator.add_photograph(photo_4)

    curator_artist1 = curator.add_artist(artist_1)
    curator_artist2 = curator.add_artist(artist_2)
    curator_artist3 = curator.add_artist(artist_3)

    diane_arbus = curator.find_artist_by_id("3")

    assert_equal [curator_photo3, curator_photo4], curator.find_photographs_by_artist(diane_arbus)
  end

  def test_it_can_return_artists_with_multiple_photographs
    curator = Curator.new
    photo_1 = {id: "1",name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: "1", year: "1954"}
    photo_2 = {id: "2",name: "Moonrise, Hernandez",artist_id: "2",year: "1941"}
    photo_3 = {id: "3", name: "Identical Twins, Roselle, New Jersey", artist_id: "3", year: "1967"}
    photo_4 = {id: "4", name: "Child with Toy Hand Grenade in Central Park", artist_id: "3", year: "1962"}

    artist_1 = {id: "1", name: "Henri Cartier-Bresson", born: "1908", died: "2004", country: "France"}
    artist_2 = {id: "2", name: "Ansel Adams", born: "1902", died: "1984", country: "United States"}
    artist_3 = {id: "3", name: "Diane Arbus", born: "1923", died: "1971", country: "United States"}

    curator_photo1 = curator.add_photograph(photo_1)
    curator_photo2 = curator.add_photograph(photo_2)
    curator_photo3 = curator.add_photograph(photo_3)
    curator_photo4 = curator.add_photograph(photo_4)

    curator_artist1 = curator.add_artist(artist_1)
    curator_artist2 = curator.add_artist(artist_2)
    curator_artist3 = curator.add_artist(artist_3)

    assert_equal [curator_artist3], curator.artists_with_multiple_photographs
  end

  def test_it_confirms_the_contents_of_the_multiple_photographs_array
    curator = Curator.new
    photo_1 = {id: "1",name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: "1", year: "1954"}
    photo_2 = {id: "2",name: "Moonrise, Hernandez",artist_id: "2",year: "1941"}
    photo_3 = {id: "3", name: "Identical Twins, Roselle, New Jersey", artist_id: "3", year: "1967"}
    photo_4 = {id: "4", name: "Child with Toy Hand Grenade in Central Park", artist_id: "3", year: "1962"}

    artist_1 = {id: "1", name: "Henri Cartier-Bresson", born: "1908", died: "2004", country: "France"}
    artist_2 = {id: "2", name: "Ansel Adams", born: "1902", died: "1984", country: "United States"}
    artist_3 = {id: "3", name: "Diane Arbus", born: "1923", died: "1971", country: "United States"}

    curator_photo1 = curator.add_photograph(photo_1)
    curator_photo2 = curator.add_photograph(photo_2)
    curator_photo3 = curator.add_photograph(photo_3)
    curator_photo4 = curator.add_photograph(photo_4)

    curator_artist1 = curator.add_artist(artist_1)
    curator_artist2 = curator.add_artist(artist_2)
    curator_artist3 = curator.add_artist(artist_3)

    diane_arbus = curator.find_artist_by_id("3")

    assert_equal 1, curator.artists_with_multiple_photographs.length
    assert_equal true, diane_arbus == curator.artists_with_multiple_photographs.first
  end

  def test_it_returns_array_of_photographs_taken_by_artists_from
    curator = Curator.new
    photo_1 = {id: "1",name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: "1", year: "1954"}
    photo_2 = {id: "2",name: "Moonrise, Hernandez",artist_id: "2",year: "1941"}
    photo_3 = {id: "3", name: "Identical Twins, Roselle, New Jersey", artist_id: "3", year: "1967"}
    photo_4 = {id: "4", name: "Child with Toy Hand Grenade in Central Park", artist_id: "3", year: "1962"}

    artist_1 = {id: "1", name: "Henri Cartier-Bresson", born: "1908", died: "2004", country: "France"}
    artist_2 = {id: "2", name: "Ansel Adams", born: "1902", died: "1984", country: "United States"}
    artist_3 = {id: "3", name: "Diane Arbus", born: "1923", died: "1971", country: "United States"}

    curator_photo1 = curator.add_photograph(photo_1)
    curator_photo2 = curator.add_photograph(photo_2)
    curator_photo3 = curator.add_photograph(photo_3)
    curator_photo4 = curator.add_photograph(photo_4)

    curator_artist1 = curator.add_artist(artist_1)
    curator_artist2 = curator.add_artist(artist_2)
    curator_artist3 = curator.add_artist(artist_3)


    assert_equal [], curator.photographs_taken_by_artists_from("Argentina")
  end
g
end
