require('pg')
require_relative('../db/SqlRunner')

class Album

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @id = options['id'].to_i
  end

end