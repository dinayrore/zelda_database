# written with SQL, Zelda Database Class with CRUD functionality
class ZeldaDatabase
  attr_reader :conn

  def initialize
    @conn = PG.connect(dbname: 'zelda')
  end

  def disable_notices
    @conn.exec('SET client_min_messages TO WARNING;')
  end

  def create_item_table
    @conn.exec(
      'CREATE TABLE IF NOT EXISTS items (' \
      'id SERIAL PRIMARY KEY, item VARCHAR)'
    )
  end

  def create_hero_table
    @conn.exec(
      'CREATE TABLE IF NOT EXISTS hero (' \
      'id SERIAL PRIMARY KEY, name VARCHAR)'
    )
  end

  def create_inventory_table
    @conn.exec(
      'CREATE TABLE IF NOT EXISTS shared_inventory (' \
      'item INTEGER REFERENCES items(item),' \
      'hero INTEGER REFERENCES hero(hero))'
    )

    @conn.exec('ALTER TABLE shared_inventory ADD FORIEGN KEY' \
    '(item) REFERENCES items(item) AND (hero) REFERENCES hero(hero)'
    )
  end
end
