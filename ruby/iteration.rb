#CHALLENGE 5-4 RELEASE 0

def thirsty
  customer1 = "Joe" 
  puts "Welcome to our bar!"
  yield(customer1)
end

thirsty { |customer1| puts "Glad you came, #{customer1}!" }

#===============================================================================#

#CHALLENGE 5-4 RELEASE 1

# declare an array and a hash, and populate each of them with some data

# array
vehicle_make = [
  "Toyota", 
  "Honda", 
  "Ford"
]

puts "original vehicle_make array data:"
p vehicle_make

# hash
vehicle_model = {
  'Toyota' => 'Prius', 
  'Honda' => 'Civic', 
  'Ford' => 'F-150'
}

puts "vehicle_model hash data:"
p vehicle_model

# Iterate through each one using .each

vehicle_make.each do |make|
  puts "This vehicle is a #{make}"
end

vehicle_model.each do |make, model|
  puts "This #{make} is a #{model}"
end

# Iterating through the array and the hash with .map
# Using .map, I modify the data to change the vehicle make
# This is a non-destructive solution that creates a new array to store the changed vehicle makes
#new_vehicle_make = vehicle_make.map do |make|
  #puts make
# make = "Land Rover"
#end

# Destructive solution that overwrites the makes stored in the vehicle_make array
vehicle_make.map! do |make|
  make = "Land Rover"
end

puts "modified vehicle_make array data:"
p vehicle_make

#p new_vehicle_make #<<< This is to check the non-destructive .map

#===============================================================================#

#CHALLENGE 5-4 RELEASE 2 

# 1. A method that iterates through the items, deleting any that meet a certain condition (for example, deleting any numbers that are less than 5).

# new array
vehicle_make2 = [
  "Toyota", 
  "Honda", 
  "Ford"
]

puts "CHALLENGE 5.4 RELEASE 2.1 original vehicle_make2 array data:"
p vehicle_make2

vehicle_make2.delete_if {|make2| make2.length < 5 }

puts "CHALLENGE 5.4 RELEASE 2.1 modified vehicle_make2 array data:"
p vehicle_make2

# 2. A method that filters a data structure for only items that do satisfy a certain condition (for example, keeping any numbers that are less than 5).

vehicle_make3 = [
  "Toyota", 
  "Honda", 
  "Ford"
]

puts "original vehicle_make3 array data:"
p vehicle_make3

vehicle_make3.keep_if { |make| make == "Ford" }

puts "modified vehicle_make3 array data:"
p vehicle_make3

# 3. A different method that filters a data structure for only items satisfying a certain condition -- Ruby offers several options!

vehicle_model2 = {
  'Toyota' => 'Prius', 
  'Honda' => 'Civic', 
  'Ford' => 'F-150'
}

puts "original vehicle_model2 hash data:"
p vehicle_model2

vehicle_model2.select { |make, model| make == "Toyota" || model == "Civic" } #<<< The success of this filter is shown as the implicit return in repl, but does not seem to appear in Terminal

# 4. A method that will remove items from a data structure until the condition in the block evaluates to false, then stops (you may not find a perfectly working option for the hash, and that's okay).

vehicle_make4 = [
  "Toyota", 
  "Honda", 
  "Ford"
]

puts "original vehicle_make3 array data:"
p vehicle_make4

vehicle_make4.take_while {|make| make != "Ford" }


