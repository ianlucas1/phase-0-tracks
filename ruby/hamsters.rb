name = nil
volume = nil
fur = nil
adoptability = nil
age = nil

p "Name of animal"
name = gets.chomp

if name = "nil"
  name = "Hammy"
else name = name
end

p "Noise level (enter as a whole number on a scale from 1 to 10 where 1 is quiet and 10 is loud)"
volume = gets.to_i

# just playing around with case and if statements here

case volume
  when '1','2','3','4'  
  volume = true
  when '5','6','7','8','9','10'
  volume = false
end

if volume == true
  volume = "Quiet"
else volume = "Loud"
end

p "Fur color (describe in your own words)"
fur = gets.chomp

p "Is it a good candidate for adoption (enter y for yes, n for no)"
adoptability = gets.chomp

if adoptability == "y"
  adoptability = true
else adoptability = false
end

p "Age of the animal (leave blank if unknown)"
age = gets.to_i

if age = "nil"
  age = "Unknown"
else age = age
end

p "ANIMAL INFO"
p "Name: #{name}"
p "Loudness: #{volume}"
p "Fur Color: #{fur}"
p "Adoptability: #{adoptability}"
p "Age: #{age}"