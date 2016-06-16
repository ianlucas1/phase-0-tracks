name = nil
age = nil
garlic = nil
insurance = nil
<<<<<<< HEAD
employees_to_process = 0
employee_number = 0

current_year = 2016

#At the beginning of your program, ask the user how many employees will be processed, then begin the survey process for the first employee. After you print the result for that employee, start the survey over again, and repeat until all the employees have been processed.

p "How many employees will be processed in today? (e.g. 3)"
employees_to_process = gets.to_i

until employee_number == employees_to_process  do

  employee_number +=1;

  p "What is your name? (e.g. Lestat)"
  name = gets.chomp
  
  p "What year were you born (e.g. 1842)"
  birth_year = gets.to_i
  age = current_year - birth_year
  
  p "Our company cafeteria serves garlic bread. Should we order some for you? (yes/no)"
  garlic = gets.chomp
  
  p "Would you like to enroll in the company’s health insurance? (yes/no)"
  insurance = gets.chomp
  
  p "EMPLOYEE ##{employee_number} INFO"
  p "Name: #{name}"
  p "Age: #{age}"
  p "Garlic Bread: #{garlic}"
  p "Insurance: #{insurance}"
  
  #If the employee got their age right, and is willing to eat garlic bread or sign up for insurance, the result is “Probably not a vampire.”
  
  if age < 65 && garlic == "yes"
    p "Detection Test 1: Probably not a vampire."
  else p "Detection Test 1: Results inconclusive."
  end
  
  #If the employee got their age wrong, and hates garlic bread or waives insurance, the result is “Probably a vampire.”
  
  if age > 65 && (garlic == "no" || insurance == "no")
    p "Detection Test 2: Probably a vampire."
  else p "Detection Test 2: Results inconclusive."
  end
  
  #If the employee got their age wrong, hates garlic bread, and doesn’t want insurance, the result is “Almost certainly a vampire.”
  
  if age > 65 && garlic == "no" && insurance == "no"
    p "Detection Test 3: Almost certainly a vampire."
  else p "Detection Test 3: Results inconclusive."
  end
  
  #Even if the employee is an amazing liar otherwise, anyone going by the name of “Drake Cula” or “Tu Fang” is clearly a vampire, because come on. In that case, you should print “Definitely a vampire.”
  
  if age > 65 && garlic == "no" && insurance == "no" || name = "Drake Cula" || name = "Tu Fang"
    p "Detection Test 4: Definitely a vampire."
  else p "Detection Test 4: Results inconclusive."
  end

end
=======

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

#If the employee got their age right, and is willing to eat garlic bread or sign up for insurance, the result is “Probably not a vampire.”

if age < 65 && garlic == "yes"
  p "Detection Test 1: Probably not a vampire."
else p "Detection Test 1: Results inconclusive."
end

#If the employee got their age wrong, and hates garlic bread or waives insurance, the result is “Probably a vampire.”

if age > 65 && (garlic == "no" || insurance == "no")
  p "Detection Test 2: Probably a vampire."
else p "Detection Test 2: Results inconclusive."
end

#If the employee got their age wrong, hates garlic bread, and doesn’t want insurance, the result is “Almost certainly a vampire.”

if age > 65 && garlic == "no" && insurance == "no"
  p "Detection Test 3: Almost certainly a vampire."
else p "Detection Test 3: Results inconclusive."
end

#Even if the employee is an amazing liar otherwise, anyone going by the name of “Drake Cula” or “Tu Fang” is clearly a vampire, because come on. In that case, you should print “Definitely a vampire.”

if age > 65 && garlic == "no" && insurance == "no" || name = "Drake Cula" || name = "Tu Fang"
  p "Detection Test 4: Definitely a vampire."
else p "Detection Test 4: Results inconclusive."
end
>>>>>>> master
