# RELEASE 0 REQUIREMENTS
# Requirement 1: swap the first name and last name (e.g. "Torres Felicia")
# Requirement 2: shift each vowel to the next higher vowel (e.g. "e" becomes "i")
# Requirement 3: shift each consonant to the next higher consonant (e.g. "t" becomes "v")
# Requirement 4: the first letter of the encoded name should be capitalized (e.g. "Vussit", not "vussit")
# Requirement 5: the encoded name should be returned as a string (e.g. "Torres Felicia" becomes "Vussit Gimodoe")

# Step 0: Creates data structure into which the aliases are pushed (for Release 2)
real_names_ary = [ ]
code_names_ary = [ ] 

# Step 1: Starts loop to permit multiple name entries (for Release 1)
loop do
  
  # Step 2: Prompts user for full name input with an option to quit program
  puts "If you want to encode a name, enter it now (e.g. 'James Bond') or type 'quit' to finish:"
  name = gets.chomp
  
  if name != "quit"
  
      # Step 3.a: Converts name to an array in order to switch their order
      name_ary = name.split #<< see end note 0
      
      # Step 3.b: Switches the order of the names in the array (to satisfy requirement 1)
      name_ary.reverse #<< see end note 1
      
      # Step 3.c: Inserts a space into the array prior to encoding
      name_ary.insert(1, " ") #<< see end note 2; this made it easier to deal with the names after encryption
      
      # Step 3.d: Converts the items in the array into a string for encoding
      name_reversed = name_ary.join('') #<< see end note 3
      
      # Step 4: Encoder method to satisfy requirements 2 and 3
      def encoder(name)
       
        vowels = %w[ a e i o u ] #<< yay for literals! (see end note 4)
        non_vowels = %w[ b c d f g h j k l m n p q r s t v w x y z ]
        name_ary = name.downcase.split(//) #<< converts unencoded name string to an array for .map operation
          
        coded_name_ary = name_ary.map do |char| #<< coded_name_ary is the name of the array containing the encoded characters; see endnote note 5
          
          if vowels.include?(char) #<< see end note 6 and proof 1
               vowels.rotate[vowels.index(char)] #<< see end notes 7 and 8 
                
            elsif non_vowels.include?(char)
                    non_vowels.rotate[non_vowels.index(char)]
                  
            elsif char == "u"
                  char = "a" #<< handles edge case for vowels
                
            elsif char == "z"
                    char = "b" #<< handles edge case for consonants
                  
            else
                  char = " " #<< handles blank spaces
                
          end #<< ends encryption logic
         
        end #<< ends .map operation
          
        coded_name_ary.join #<< converts coded name array into a string for further processing
        
      end #<< ends Step 4
        
      # Step 5: Passes reversed name string into encoder method, resulting in an encoded name string
      encoded_name = encoder(name_reversed)
      
      # Step 6: Transforms encoded name string into an array for capitalization
      coded_name_ary = encoded_name.split
      
      # Step 7: Capitalizes the first letter of each name to satisfy requirement 4 and handles the possibility that the agent goes by one name (e.g. 'Bond')
      if coded_name_ary.length == 1
        code_name = coded_name_ary[0].capitalize #<< see end note 9
        else
        capitalized_alias_last_name = coded_name_ary[0].capitalize
        capitalized_alias_first_name = coded_name_ary[1].capitalize
        capitalized_full_alias_array = [capitalized_alias_last_name, capitalized_alias_first_name]
        capitalized_full_alias_array.insert(1, " ")
        code_name = capitalized_full_alias_array.join #<< code_name is the final encoded name string, satisfying requirement 5
      end
      
      puts "#{name}, your alias is #{code_name}."
    
      # Step 8: Adds real names and code names to their respective arrays (for Release 2)
      real_names_ary.push(name) #<< see end note 10
      code_names_ary.push(code_name)
      
      else 
        break #<< stops loop when 'quit' is entered
  end #<< closes out the if-else logic inside of loop
end #<< closes out the loop and satisfies Release 1

# p code_names_ary #<< in case you want to see the items of this array containing the coded names
# p real_names_ary #<< in case you want to see the items of this array containing the real names

# Step 9: Merging the two arrays into a hash where the keys (values) are agent code names (real names)
agent_names = Hash[code_names_ary.zip(real_names_ary)] #<< see end notes 11 and 12

# Step 10: Iterating through the agent_names hash and printing all of the data the user entered
agent_names.each do |code_name, real_name| #<< see end note 13
  puts "#{code_name} is really #{real_name}" #<< satisfies Release 2
end



# PROOF 1: Shifting vowels to next higher vowel
# Paste the following lines into bash to demonstrate the core business logic from the encoder
# vowels = %w[ a e i o u]
# vowels.index('a')
# vowels.rotate(1)[vowels.index('a')]

# END NOTES
# 0) str.split documentation: http://ruby-doc.org/core-2.1.5/String.html#method-i-split
# 1) ary.reverse documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-reverse
# 2) ary.insert documenation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-insert
# 3) ary.join documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-join
# 4) literals documentation: http://ruby-doc.org/core-2.1.5/doc/syntax/literals_rdoc.html
# 5) ary.map documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-map
# 6) ary.include?(x) documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-include-3F
# 7) ary.rotate(x) documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-rotate
# 8) ary.index documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-index
# 9) string.capitalize documentation:  http://ruby-doc.org/core-2.1.5/String.html#method-i-capitalize
# 10) ary.push documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-push
# 11) ary.zip documentation: http://ruby-doc.org/core-2.1.5/Array.html#method-i-zip
# 12) new_hash documentation: http://ruby-doc.org/core-2.1.5/Hash.html#method-c-5B-5D
# 13) hash.each documentation: http://ruby-doc.org/core-2.1.5/Hash.html#method-i-each