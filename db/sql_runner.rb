require("pg")

class SqlRunner

  def SqlRunner.run(sql, values = [])

    begin
      #open the connection
      db = PG.connect({dbname: "music_collection", host: "localhost"})
      # prepares the SQL statement
      db.prepare("query", sql)
      # execute the prepared statement and pass in the values
      # prepared method prevents SQL injection attacks - more secure
      result = db.exec_prepared("query", values) #=>returns a PG result - an array of hashes - stored into result variable
    ensure
      #close the connection
      db.close()
    end
    return result # => returning array of hashes

  end


end
