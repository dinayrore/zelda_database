require 'optparse'
require_relative 'parse'
require 'pry'
#
class IdentifyOptions
  def parse_options
    data = {}

    option = OptionParser.new

    parser = Parse.new(option, data)

    parser.help

    parser.discover_item

    parser.find_hero

# have not figured this one out yet...
    parser.search_inventory

    parser.insert_item

    parser.add_hero
# edit functions do not work...
    parser.update_item

    parser.edit_hero

    parser.lose_item

    parser.remove_hero

    option.parse!

    data
  end
end
