# Build a house out of classes

# HOUSE CLASS
# Attributes:
# - rooms (a collection of Room instances)
# Methods:
# - getter for rooms
# - add_room (only allows up to 10 rooms)
# - square_footage (adds up the house's square footage and returns it as an integer)
# - total_value (adds up the value of items in all rooms)

require_relative "item"
require_relative "room"

class House
  attr_reader :rooms

  def initialize
    @rooms = []
  end

  def add_room(room)
    if rooms.length < 11
      @rooms << room
      true
    else
      false
    end
  end

  # This is the original method, from the video, for adding up the value of all the items in the house
  # def total_value
  #   value = 0
  #   @rooms.each do |room|
  #     value += room.total_value
  #   end
  #   value
  # end

  # This is a way to use the inject method to add up the total value of the items in the house
  def total_value
    value = @rooms.inject(0) {|sum, room| sum + room.total_value}
  end

  def square_footage
    sq_footage = 0
    @rooms.each do |room|
      sq_footage += (room.width * room.length)
    end
    sq_footage
  end

  def to_s
    house_str = ""
    @rooms.each do |room|
      house_str << room.to_s.upcase
      house_str << "\n\n"
      room.items.each do |item|
        house_str << item.to_s
        house_str << "\n"
      end
      house_str << "\n"
    end
    house_str
  end
end


# Driver code to ensure this unit works

# Make house
house = House.new

# Make Living Room
living_room = Room.new("Living Room", 10, 10)
piano = Item.new("piano", "black", 10000)
box = Item.new("cardboard box", "brown", 0)
living_room.items << piano
living_room.items << box

# Make Kitchen
kitchen = Room.new("Kitchen", 10, 10)
sink = Item.new("sink", "white", 5000)
oven = Item.new("oven", "white", 3000)
kitchen.items << sink
kitchen.items << oven

house.add_room(living_room)
house.add_room(kitchen)

puts house
puts "The total value of all the items in the house is #{house.total_value} cents."