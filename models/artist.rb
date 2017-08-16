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




end
