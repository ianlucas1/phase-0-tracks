# Release 2: Build an Encryption Program

# Encryption Pseudo-code
# Accept password string input
# For each character in the string, identify the letter in each index position
# To encrypt, shift each character to the next letter of the alphabet
# Blank spaces are not to be transformed
# The letter "z" is an edge case, and a rule needs to be added to transform "z" to an "a"

# Encryption Pseudo-code
# Accept encrypted password string input
# For each character in the string, identify the letter in each index position
# To encrypt, shift each character to the prior letter of the alphabet
# Blank spaces are not to be transformed
# The letter "z" is an edge case; need to determine if the rule from the enc

def encrypt(password)
  index = 0
  until index == password.to_s.length  #The .to_s was helpful in overcoming nil-related errors
    if password[index] == "z"  #Handles edge case
       password[index] = "a"
    elsif password[index] == " "  #Handles blank spaces
       password[index] = " "
    else
       password[index] = password[index].next  #Primary encryption rule
    end
    index += 1  #Progresses encryption to the character in the next index position
  end
end

def decrypt(password)
  index = 0
  alpha = "abcdefghijklmnopqrstuvwxyz" #Decryption rule reference
  until index == password.to_s.length
    if password[index] == " "  
       password[index] = " "
    else
     password[index] = alpha[alpha.index(password[index]) - 1]  #Primary decryption rule
  end
    index += 1
  end
end

# Release 3:  Test Your Program (by Running Encryption and Decryption Methods in Sequence)

#puts "Enter your password (lowercase letters and blank spaces only)"
#password = gets.chomp

#encrypt(password)
#p "Here is the encrypted password: #{password}"

#decrypt(password)
#p "Here is the password after decryption: #{password}"

#####

# Release 4: Try a Nested Method Call

#password = "abc"
#decrypt(encrypt(password)) # HELP!  THIS ONLY SEEMS TO RUN THE ENCRYPTION 
#p password

#####

# Release 5: Add an Interface

puts "Would you like to encrypt a password, decrypt a password, or run encryption and decryption in sequence? (enter 1, 2, or 3, respectively)"
selector = gets.to_i

puts "Enter your password (lowercase letters and blank spaces only)"
password = gets.chomp

if selector == 1
  encrypt(password)
elsif selector == 2
  decrypt(password)
elsif selector == 3 # This option is supposed to run the nexted method call
  decrypt(encrypt(password)) # HELP!  THIS ONLY SEEMS TO RUN THE ENCRYPTION 
else 
  p "Invalid input"
end
p "Here is the password after processing user input: #{password}"

##### END OF PROGRAM #####
