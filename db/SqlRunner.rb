require_relative('pg')

class SqlRunner()

  def self.run(sql)
   begin
      db = PG.connect({dbname: 'Music', :host 'localhost'})
      result = db.exec(sql)
    ensure
      db.close
    end
  return result
  end
end