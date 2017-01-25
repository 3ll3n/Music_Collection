require('pg')
require_relative('../db/SqlRunner')

class Artist

  attr_reader :name, :id

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

end