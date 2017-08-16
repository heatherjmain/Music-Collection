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
        # def save()
          # sql = "INSERT INTO artists (name) VALUES ($1)
            # RETURNING id;"

            # values = [@name]
            # returned_array = SqlRunner.run(sql, values)
            # @id = returned_array[0]["id"].to_i()
          # end

# * Create and Save Albums
          # def save()
            # sql = "
              # INSERT INTO albums (
                # artist_id,
                # title,
                # genre
                # ) VALUES (
                # $1, $2, $3
                # )
                # RETURNING id;"

                # values = [@artist_id, @title, @genre]
                # returned_data = SqlRunner.run(sql, values)
                # @id = returned_data[0]["id"].to_i()
              # end

# * List All Artists/Albums
          # def Artist.all()
            # sql = "SELECT * FROM artists;"
            # results = SqlRunner.run(sql)

            # artist = results.map {|artist_hash| Artist.new(artist_hash)}

            # return artist
          # end


# * List all the albums they have by an artist
        # def albums()
          # sql = "
            # SELECT title FROM albums
            # WHERE artist_id = $1;"
            # album_hash = SqlRunner.run(sql, [@id])

            # albums = album_hash.map do |album_hash|
              # Album.new(album_hash)
            # end
            # return albums
          # end

# * Show the artist any album belongs to
          # def artist()
            # sql = "
            # SELECT * FROM artists
            # WHERE id = $1;"
            # results_array = SqlRunner.run(sql, [@artist_id])

            # artist_hash = results_array[0]
            # artist_object = Artist.new(artist_hash)
            # return artist_object
          # end


# Every artist should have a name, and each album should have a name/title, genre and artist ID.
#
# ## Further tasks
#
# Additionally it would be nice to be able to:
#
# * Edit Artists/Albums
          # def update()
            # sql = "
            # UPDATE artists SET (
              # name
              # ) = (
              # $1
              # )
              # WHERE id = $2;"

              # values = [@name, @id]
              # SqlRunner.run(sql, values)
            # end

            # def update()
            #   sql = "
            #   UPDATE albums SET (
            #     artist_id,
            #     title,
            #     genre
            #   ) = (
            #     $1, $2, $3
            #   )
            #   WHERE id = $4;"
            #
            #   values = [@artist_id, @title, @genre, @id]
            #   SqlRunner.run(sql, values)
            # end

# * Delete Artists/Albums
          # def delete()
            # sql = "DELETE FROM artists WHERE id = $1;"
            # SqlRunner.run(sql, [@id])
          # end

          # def Artist.delete_all()
            # sql = "DELETE FROM artists;"
            # SqlRunner.run(sql)
          # end


          # def delete()
          #   sql = "DELETE FROM albums WHERE id = $1;"
          #   SqlRunner.run(sql, [@id])
          # end
          #
          # def Album.delete_all()
          #   sql = "DELETE FROM albums;"
          #   SqlRunner.run(sql)
          # end

# * Find Artists/Albums by their ID
          # def find_artist()
            # sql = "SELECT name FROM artists WHERE id = $1;"
            # result_array = SqlRunner.run(sql, [@id])

            # name_hash = result_array[0]
            # name_object = Artist.new(name_hash)
            # return name_object.name
          # end


          # def find_album()
          #   sql = "SELECT title FROM albums WHERE ID = $1;"
          #   result_array = SqlRunner.run(sql, [@id])
          #
          #   title_hash = result_array[0]
          #   title_object = Album.new(title_hash)
          #   return title_object.title
          # end

# Remember to regulary git commit!
