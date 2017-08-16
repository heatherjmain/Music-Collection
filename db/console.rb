require("pry-byebug")
require_relative("../models/album")
require_relative("../models/artist")



artist1 = Artist.new({"name" => "Pink Floyd"})
artist2 = Artist.new({"name" => "The Beatles"})
artist3 = Artist.new({"name" => "The Strokes"})

artist1.save()
artist2.save()
artist3.save()

album1 = Album.new({
  "artist_id" => artist1.id,
  "title" => "The Dark Side of the Moon",
  "genre" => "Rock"
  })

album2 = Album.new({
  "artist_id" => artist2.id,
  "title" => "Abbey Road",
  "genre" => "Pop"
  })

album3 = Album.new({
  "artist_id" => artist3.id,
  "title" => "Is This It",
  "genre" => "Rock"
  })

album4 = Album.new({
  "artist_id" => artist2.id,
  "title" => "Let It Be",
  "genre" => "Pop"
  })

album5 = Album.new({
  "artist_id" => artist2.id,
  "title" => "Yellow Submarine",
  "genre" => "Pop"
  })

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()



binding.pry
nil




# ## Music Collection
#
# You have been asked to create an app that will allow a music collector to manage their collection of CDs/records.
#
# In their console they would like to be able to:
#
# * Create and Save Artists
# * Create and Save Albums
# * List All Artists/Albums
    # => SELECT * FROM artists;
    # => SELECT * FROM albums;


# * List all the albums they have by an artist
    # => SELECT title FROM albums WHERE artist_id = 2;

# * Show the artist any album belongs to
    # => (in pry) - album1.artist


# Every artist should have a name, and each album should have a name/title, genre and artist ID.
#
# ## Further tasks
#
# Additionally it would be nice to be able to:
#
# * Edit Artists/Albums
# * Delete Artists/Albums
# * Find Artists/Albums by their ID
#
# Remember to regulary git commit!
