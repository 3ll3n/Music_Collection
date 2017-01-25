require('pg')
require_relative('../db/SqlRunner')

class Album

  attr_accessor :title, :genre, :artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO albums(title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) returning *;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    result = SqlRunner.run(sql)
    return result.map{ |album| Album.new(album)}
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    results = SqlRunner.run(sql)
    return results.map { |artist| Artist.new(artist) }
  end

end