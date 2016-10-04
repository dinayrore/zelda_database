require 'pry'
#
class Inventory
  attr_accessor :search

  def initialize(data, zdb)
    @search = data[:search]
    @conn = zdb.conn
  end

  def find
    database = @conn.exec('SELECT * FROM items ' \
    "WHERE name = '#{@search}'")
    database.each do |inventory|
      puts "hero_id: #{inventory['hero_id']} | item_id: #{inventory['item_id']} "
    end
  end

  # trying to create a method to add things to inventory table...
  def method_name
    'SELECT * FROM items, hero, WHERE items name column = table 2 tbl2 column'
  end
end
