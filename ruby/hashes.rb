# Challenge 5, Release 3:  Interior Designer Hashes


# Create hash to store the following details for a client: 
# name, age, number of children, and decor theme
client = {name: nil, age: nil, children: nil, likes_modern_decor: nil}


# Prompt the designer for all of this information.
puts "Enter client's first and last name: (e.g. Jane Doe)"
  client[:name] = gets.chomp

puts "Enter client's age: (e.g. 35)"
  client[:age] = gets.to_i

puts "Enter number of children that the client has: (e.g. 2)"
  client[:children] = gets.to_i

puts "Does client like modern decor: (yes/no)"
  client[:likes_modern_decor] = gets.chomp


# Give the user the opportunity to update a key
loop do
  puts "If you want to update entry, type the category ('name', 'age', 'children', or 'decor' OR enter 'none' to finish):"
  update = gets.chomp
  
  if update == "name"
      puts "Enter client's first and last name:"
        client[:name] = gets.chomp
  elsif update == "age"
      puts "Enter client's age:"
        client[:age] = gets.to_i
  elsif update == "children"
      puts "Enter number of children that the client has:"
        client[:children] = gets.to_i
  elsif update == "decor"
      puts "Does client like modern decor: (yes/no)"
        client[:likes_modern_decor] = gets.chomp
  elsif update == 'none'
    break
  else 
    puts "I'm sorry, I didn't understand that response."
  end
end


# Convert any input to the appropriate data type.
if client[:likes_modern_decor] == "yes"
  client[:likes_modern_decor] = true
else client[:likes_modern_decor] = false
end


# Print the hash all questions have been answered.
p client