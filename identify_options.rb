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

    parser.search_inventory

    parser.insert_item

    parser.add_hero

    parser.update_item

    parser.edit_hero

    parser.lose_item

    parser.remove_hero

    option.parse!

    data
  end
end
