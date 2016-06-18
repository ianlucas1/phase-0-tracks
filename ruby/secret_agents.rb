#Release 2: Build an Encryption Program

#1. Encrypt

#An encrypt method that advances every letter of a string one 
#letter forward. So "abc" would become "bcd". For now, you can 
#assume lowercase input and output. Any space character should 
#remain a space character -- no change made.

#Write a string
#For each character in the string, call the next letter in the alphabet
#Thus, "abc" becomes "bcd"
#Assume lowercase input/output
#Blank space characters remain are to be unchanged

password = nil

#ENCRYPTION
def encrypt(password)
  index = 0
  while index < password.length
    password[index] = password[index].next
    index += 1
  end
end

#DECRYPTION
def decrypt(password)
  index = 0
  alpha = "abcdefghijklmnopqrstuvwxyz"
  while index < password.length
    p alpha.index(password[index]) - 1
    index += 1
  end
end

puts "Enter your password"
password = gets.chomp

encrypt(password)
p password

decrypt(password)
p password