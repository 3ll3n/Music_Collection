require('pg')
require_relative('../db/SqlRunner')

class Album

  attr_accessor :title, :genre
  attr_reader :artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO albums(title) VALUES ('#{title}') returning *;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    result = SqlRunner.run(sql)
    return result.map{ |album| Album.new(album)}
  end

end