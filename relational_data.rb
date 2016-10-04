require 'pry'
require_relative 'zelda_database'
require_relative 'identify_options'
require_relative 'items'
require_relative 'heroes'


def search_items(item, data)
  item.find if data.key? :discover

  item.save if data.key?(:insert || :edit)

  item.remove if data.key? :lose
end

def search_heroes(hero, data)
  hero.find if data.key? :find

  hero.save if data.key? :add

  hero.remove if data.key? :remove
end

def main
  zdb = ZeldaDatabase.new

  zdb.disable_notices

  zdb.create_item_table

  zdb.create_hero_table

  zdb.create_inventory_table

  data = IdentifyOptions.new.parse_options

  item = Items.new(data, zdb)

  search_items(item, data)

  hero = Heroes.new(data, zdb)

  search_heroes(hero, data)
end

main if __FILE__ == $PROGRAM_NAME
