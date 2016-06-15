# c4-3-r1

# In phase-0-tracks/ruby/hamsters.rb, build a Ruby program that asks the user for the following pieces of data about the hamster and stores them in variables:

# - hamster's name (the clerk names any hamsters who come in without name tags, so all hamsters have names)
# - volume level from 1 to 10 (some people are light sleepers who won't adopt extra-squeaky hamsters)
# - fur color
# - whether the hamster is a good candidate for adoption
# - estimated age

# Of course, it can be difficult to guess how old a stray hamster is, especially if that hamster has moisturized and regularly and stayed out of the sun. If the user leaves the "Estimated age?" question blank, you should set your variable for estimated age to nil.

name = nil
volume = nil
fur = nil
adoptability = nil
age = nil

p "Name of animal"
name = gets.chomp

p "Noise level"
volume = gets.to_i

p "Fur color"
fur = gets.chomp

p "Is it a good candidate for adoption"
adoptability = gets.chomp

p "Age of the animal (leave blank if unknown)"
fur = gets.to_i