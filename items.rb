# Items Class written with SQL including CRUD functionality
class Items
  attr_accessor :discover, :insert, :edit, :lose
  attr_reader :id

  def initialize(data, zdb)
    @id = nil
    @data = data
    @conn = zdb.conn
  end

  def find
    database = @conn.exec('SELECT * FROM items ' \
    "WHERE item = '#{@data[:discover]}'")
    database.each do |item|
      puts "id: #{item['id']} | item: #{item['item']} "
    end
  end

  def save
    if @id.nil?
      result = @conn.exec('INSERT INTO items (item) ' \
        "SELECT ('#{@data[:insert]}')")
    else
      con.exec("UPDATE items SET item = '#{@data[:update]}', " \
      "WHERE item = '#{@data[:insert]}'")
    end
  end

  def remove
    @conn.exec("DELETE FROM items WHERE item = '#{@data[:lose]}'")
  end
end
