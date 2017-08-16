require_relative("../db/sql_runner")

class Artist

  attr_accessor(:name)
  attr_reader(:id)

  def initialize( artist_details )
    @id = artist_details["id"].to_i() if artist_details["id"]
    @name = artist_details["name"]
  end


  def save()
    sql = "INSERT INTO artists (name) VALUES ($1)
      RETURNING id;"

    values = [@name]
    returned_array = SqlRunner.run(sql, values)
    @id = returned_array[0]["id"].to_i()
  end


  def Artist.all()
    sql = "SELECT * FROM artists;"
    results = SqlRunner.run(sql)

    artist = results.map {|artist_hash| Artist.new(artist_hash)}

    return artist
  end


  def albums()
    sql = "
      SELECT * FROM albums
      WHERE artist_id = $1;"
    album_hash = SqlRunner.run(sql, [@id])

    albums = album_hash.map do |album_hash|
      Album.new(album_hash)
    end
    return albums
  end


  def delete()
    sql = "DELETE FROM artists WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end


  def Artist.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end


  def update()
    sql = "
    UPDATE artists SET (
      name
    ) = (
      $1
    )
    WHERE id = $2;"

    values = [@name, @id]
    SqlRunner.run(sql, values)
  end




end
