# Parsing class to be used with my own unique OptionParser
class Parse
  def initialize(option, data)
    @option = option
    @data = data
  end

  def help
    @option.banner = 'How To Run: ruby sql_search_engine.rb option'

    @option.on('-h', '--help') do
      puts @option
      # ^ does not print my options...?
      exit
    end
  end

  def discover_item
    @option.on('-d', '--discover ITEM') do |item|
      @data[:discover] = item
    end
  end

  def find_hero
    @option.on('-f', '--find HERO') do |hero|
      @data[:find] = hero
    end
  end

  def search_inventory
    @option.on('-s', '--search INVENTORY') do |inventory|
      @data[:search] = inventory
    end
  end

  def insert_item
    @option.on('-i', '--insert ITEM') do |item|
      @data[:insert] = item
    end
  end

  def add_hero
    @option.on('-a', '--add HERO') do |hero|
      @data[:add] = hero
    end
  end

  def update_item
    @option.on('-u', '--update ITEM') do |item|
      @data[:update] = item
    end
  end

  def edit_hero
    @option.on('-e', '--edit ITEM') do |hero|
      @data[:edit] = hero
    end
  end

  def lose_item
    @option.on('-l', '--lose ITEM') do |item|
      @data[:lose] = item
    end
  end

  def remove_hero
    @option.on('-r', '--remove HERO') do |hero|
      @data[:remove] = hero
    end
  end
end
