agent_names = {} # Creates data structure into which real names and aliases are stored

loop do # Starts loop to permit multiple entries (for Release 1)

  puts "Enter your name to encode or type 'quit' to finish:"
  name = gets.chomp
  
  break if name == "quit"
  
  name_ary = name.downcase.split.reverse.insert(1, " ").join('').split(//)
  # Notes on the beefy name_ary variable:
    # .downcase.split converts lowercased name to an array
    # .reverse switches the order of the names in the array
    # .insert(1, " ") adds a space between the first/last names in the array
    # .join('') converts the items in the array into a string
    # .split(//) converts unencoded name string to an array of single characters for the encoder

  def encoder(name)
    
    letters = %w[ a e i o u b c d f g h j k l m n p q r s t v w x y z] # Yay for literals!
    name.map do |char| 
      
      if char == "u" # Handle vowel edge case
           char = "a"
      elsif char == "z" # Handle consonant edge case
            char = "b"          
      elsif letters.include?(char) 
              letters.rotate[letters.index(char)] # Core business logic
      else 
        char = char # Handles blank space
      end
    end 
  end

  coded_name_ary = encoder(name_ary).join.split # Initiates encoder method, then turns the resulting individual character array back into a string, and finally converts the string into an array with the encoded last name in index position 0 and the encoded first name in index position 1

  if coded_name_ary.length == 1 # Handles the possibility that the agent has just one name (e.g. Bond)
    code_name = coded_name_ary[0].capitalize
  else
    coded_last_name = coded_name_ary[0].capitalize # Converts encoded last name into a string to capitalize the first letter
    coded_first_name = coded_name_ary[1].capitalize # Capitalizes the first name
    code_name = [coded_last_name, coded_first_name].insert(1, " ").join # Converts the capitalized name strings into an array, re-inserts the blank space between the first and last names, and finally turns the fully encoded name back into a string 
  end

  agent_names[name] = code_name # Pushes the name (key) and code name (value) to the agent_names hash

end 

agent_names.each do |name, code_name| #Iterates through hash and prints user data for Release 2
  puts "#{name}'s super secret code name is #{code_name}"
end

# END NOTES
# str.split documentation: http://ruby-doc.org/core-2.1.5/String.html#method-i-split
# ary.reverse documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-reverse
# ary.insert documenation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-insert
# ary.join documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-join
# literals documentation: http://ruby-doc.org/core-2.1.5/doc/syntax/literals_rdoc.html
# ary.map documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-map
# ary.include?(x) documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-include-3F
# ary.rotate(x) documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-rotate
# ary.index documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-index
# string.capitalize documentation:  http://ruby-doc.org/core-2.1.5/String.html#method-i-capitalize
# hash.each documentation: http://ruby-doc.org/core-2.1.5/Hash.html#method-i-each