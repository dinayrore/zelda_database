#
class HeroOfTimeInventory
  def initialize(zdb)
    @conn = zdb.conn
  end

  def find
    inventory = @conn.exec('SELECT * FROM inventory')
    inventory.each do |items|
      return items
    end
  end
end
