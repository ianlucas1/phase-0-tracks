# YOU'LL HAVE TO EXCUSE THE UNUSUAL FORMATTING:  I WAS TRYING TO MAKE THE OUTPUT IN REPL MORE READABLE :-)

p "#CHALLENGE 5.4 RELEASE 0"

p "A method that takes a block:"

def thirsty
  customer1 = "Norm" 
  puts "Welcome to Cheers!"
  yield(customer1)
end

thirsty { |customer1| puts "Glad you came, #{customer1}!" }

p "............................................"


p "CHALLENGE 5.4 RELEASE 1"

# declare an array and a hash, and populate each of them with some data

# array
vehicle_make = [
  "Toyota", 
  "Honda", 
  "Ford"
]

#puts "original vehicle_make array data:"
#p vehicle_make

# hash
vehicle_model = {
  'Toyota' => 'Prius', 
  'Honda' => 'Civic', 
  'Ford' => 'F-150'
}

#puts "vehicle_model hash data:"
#p vehicle_model

p "Array iterations using .each:"

vehicle_make.each do |make|
  puts "This vehicle is a #{make}"
end

p "----------------"

p "Hash iterations using .each:"

vehicle_model.each do |make, model|
  puts "This #{make} is a #{model}"
end

p "----------------"

p "Iterations through the array with .map:"
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

#puts "Modified vehicle_make array data:"
p vehicle_make

#p new_vehicle_make #<<< This is to check the non-destructive .map

p "............................................"


p "CHALLENGE 5.4 RELEASE 2"

# 1. A method that iterates through the items, deleting any that meet a certain condition (for example, deleting any numbers that are less than 5).

# Array
vehicle_make2 = [
  "Toyota", 
  "Honda", 
  "Ford"
]

puts "1.a) Original array:"
p vehicle_make2

vehicle_make2.delete_if {|make| make.length < 5 }

puts "Modified array:"
p vehicle_make2

# Hash
vehicle_model2 = {
  'Toyota' => 'Prius', 
  'Honda' => 'Civic', 
  'Ford' => 'F-150'
}

puts "1.b) Original hash:"
p vehicle_model2

puts "Modified hash:"
p vehicle_model2.delete_if { |make, model| make.length < 5 } 

p "----------------"


# 2. A method that filters a data structure for only items that do satisfy a certain condition (for example, keeping any numbers that are less than 5).

# Array 
vehicle_make3 = [
  "Toyota", 
  "Honda", 
  "Ford"
]

puts "2.a) Original array:"
p vehicle_make3

vehicle_make3.keep_if { |make| make == "Ford" }

puts "Modified array:"
p vehicle_make3

# Hash
vehicle_model3 = {
  'Toyota' => 'Prius', 
  'Honda' => 'Civic', 
  'Ford' => 'F-150'
}

puts "2.b) Original hash:"
p vehicle_model3

puts "Modified hash:"
p vehicle_model3.keep_if { |make, model| make == "Ford" }


p "----------------"

# 3. A different method that filters a data structure for only items satisfying a certain condition -- Ruby offers several options!

# Array 
vehicle_make4 = [
  "Toyota", 
  "Honda", 
  "Ford"
]

puts "3.a) Original array:"
p vehicle_make4

vehicle_make4.select { |make| make == "Toyota" || make == "Honda" }

puts "Modified array:"
p vehicle_make3

# Hash
vehicle_model4 = {
  'Toyota' => 'Prius', 
  'Honda' => 'Civic', 
  'Ford' => 'F-150'
}

puts "3.b) Original hash:"
p vehicle_model4

puts "Modified hash:"
p vehicle_model4.select { |make, model| make == "Toyota" || model == "Civic" } 


p "----------------"

# 4. A method that will remove items from a data structure until the condition in the block evaluates to false, then stops (you may not find a perfectly working option for the hash, and that's okay).

vehicle_make5 = [
  "Toyota", 
  "Honda", 
  "Ford"
]

puts "4.a) Original array:"
p vehicle_make5

puts "Modified array:"
p vehicle_make5.take_while {|make| make != "Ford" }

