# written with SQL, Heroes Class CRUD functionality
class Heroes
  attr_accessor :find, :add, :remove
  attr_reader :id

  def initialize(data, zdb)
    @id = nil
    @data = data
    @conn = zdb.conn
  end

  def find
    database = @conn.exec('SELECT * FROM hero ' \
    "WHERE name = '#{@data[:find]}'")
    database.each do |hero|
      puts "id: #{hero['id']} | name: #{hero['name']} "
    end
  end

  def save
    if @id.nil?
      result = @conn.exec('INSERT INTO hero (name) ' \
        "SELECT ('#{@data[:add]}')")
    else
      con.exec("UPDATE hero SET name = '#{@data[:edit]}', " \
      "WHERE name = '#{@data[:add]}'")
    end
  end

  def remove
    @conn.exec("DELETE FROM hero WHERE name = '#{@data[:remove]}'")
  end
end
