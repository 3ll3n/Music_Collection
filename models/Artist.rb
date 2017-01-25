require('pg')
require_relative('../db/SqlRunner')

class Artist

  attr_accessor :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO artists(name) VALUES ('#{@name}') returning *;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i 
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    return result.map{ |artist| Artist.new(artist)}
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    results = SqlRunner.run(sql)
    return results.map { |album_hash| Album.new( album_hash ) }
  end 

  def update()
    sql = "UPDATE artists SET (name) = ('#{name}') WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end

  # def self.delete_all()
  #   sql = "DELETE * FROM artists;"
  #   result = SqlRunner.run(sql)
  # end


end