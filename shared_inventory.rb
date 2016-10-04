require 'pry'
#
class SharedInventory
  attr_accessor :search

  def initialize(data, zdb)
    @id = nil
    @data = data
    @conn = zdb.conn
  end

  def find
    database = @conn.exec('SELECT * FROM items ' \
    "WHERE name = '#{@data[:search]}'")
    database.each do |inventory|
      puts "item: #{shared_inventory['item']} | " \
      "hero: #{shared_inventory['name']}"
    end
  end

  # trying to create a method to add things to inventory table...
  def method_name
    'SELECT * FROM items, hero, WHERE items name column = table 2 tbl2 column'
  end
end
