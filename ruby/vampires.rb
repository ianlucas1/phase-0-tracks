name = nil
age = nil
garlic = nil
insurance = nil

current_year = 2016


p "What is your name? (e.g. Lestat)"
name = gets.chomp

p "What year were you born (e.g. 1842)"
birth_year = gets.to_i
age = current_year - birth_year

p "Our company cafeteria serves garlic bread. Should we order some for you? (yes/no)"
garlic = gets.chomp

p "Would you like to enroll in the company’s health insurance? (yes/no)"
insurance = gets.chomp

p "EMPLOYEE INFO"
p "Name: #{name}"
p "Age: #{age}"
p "Garlic Bread: #{garlic}"
p "Insurance: #{insurance}"
