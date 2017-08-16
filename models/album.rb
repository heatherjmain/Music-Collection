require_relative("../db/sql_runner")

class Album

  attr_accessor(:title, :genre)
  attr_reader(:id, :artist_id)

  def initialize( album_details )
    @artist_id = album_details["artist_id"]

    @title = album_details["title"]
    @genre = album_details["genre"]
    @id = album_details["id"].to_i() if album_details["id"]
  end

  def save()
    sql = "
      INSERT INTO albums (
        artist_id,
        title,
        genre
      ) VALUES (
        $1, $2, $3
      )
      RETURNING id;"

    values = [@artist_id, @title, @genre]
    returned_data = SqlRunner.run(sql, values)
    @id = returned_data[0]["id"].to_i()
  end


  def Album.all()
    sql = "SELECT * FROM albums;"
    results = SqlRunner.run(sql)

    album = results.map {|album_hash| Album.new(album_hash)}

    return album
  end


  def artist()
    sql = "
    SELECT * FROM artists
    WHERE id = $1;"
  results_array = SqlRunner.run(sql, [@artist_id])

  artist_hash = results_array[0]
  artist_object = Artist.new(artist_hash)
  return artist_object
  end


  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end


  def Album.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end


  def update()
    sql = "
    UPDATE albums SET (
      artist_id,
      title,
      genre
    ) = (
      $1, $2, $3
    )
    WHERE id = $4;"

    values = [@artist_id, @title, @genre, @id]
    SqlRunner.run(sql, values)
  end




end
