# ROOM CLASS
# Attributes:
# - name
# - width
# - length
# - items (a collection of Item instances)
# Methods:
# - getters for items, name, width, length
# - setter for items, name
# - total value (adds up prices of items)
# - to_s override

require_relative "item"

class Room
  attr_reader :width, :length
  attr_accessor :name, :items

  def initialize(name, width, length)
    @name = name
    @width = width
    @length = length
    @items = []
  end

  # This is the original method, from the video, for adding up the value of all the items in one room
  # def total_value
  #   total = 0
  #   @items.each do |item|
  #     total += item.price
  #   end  
  #   total
  # end

  # This is a way to use the inject method to add up the total value of the items in a room
  def total_value
    total = @items.reduce(0) {|sum, item| sum + item.price}
  end

  def to_s
   "#{@name} (#{length} x #{width})"    
  end
end


# Driver code to ensure this unit works
# living_room = Room.new("Living Room", 20, 35)
# piano = Item.new("piano", "black", 10000)
# box = Item.new("cardboard box", "brown", 0)
# living_room.items << piano
# living_room.items << box
# puts living_room.items
# puts living_room.total_value
