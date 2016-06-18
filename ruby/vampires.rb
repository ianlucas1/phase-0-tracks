name = nil
age_input = nil
birthyear = nil
current_year = 2016
actual_age = nil
garlic = nil
insurance = nil
vampire_score = nil
employees_to_process = nil
employee_count = 0

p "How many employees will be processed in today? (please enter as a whole number, e.g. 3)"
employees_to_process = gets.to_i

until employee_count == employees_to_process  do

  employee_count +=1;
  
  p "What is your name? (e.g. Lestat)"
    name = gets.chomp
    
  p "How old are you (e.g. 39)"
    age_input = gets.to_i
  
  p "What year were you born (e.g. 1842)"
    birth_year = gets.to_i
      actual_age = current_year - birth_year
    
  p "Our company cafeteria serves garlic bread. Should we order some for you? (yes/no)"
    garlic = gets.chomp
    
  p "Would you like to enroll in the company’s health insurance? (yes/no)"
    insurance = gets.chomp
  
  allergies = nil
  
  until allergies == "done" || allergies == "sunshine"  do
    p "Please list any allergies that you have, one at a time (e.g. peanuts). After you have entered all your allergies, or if you don't have any allergies, enter 'done'."
    allergies = gets.chomp
  end
  
    if name == "Drake Cula" || name == "Tu Fang"
      vampire_score = 1
    elsif age_input != actual_age && garlic == "no" && insurance == "no"
      vampire_score = 2
    elsif age_input != actual_age && (garlic == "no" || insurance == "no")
      vampire_score = 3.1
    elsif allergies == "sunshine"
      vampire_score = 3.2
    elsif age_input == actual_age && (garlic == "yes" || insurance == "yes")
      vampire_score = 4
    else
      vampire_score = 5
    end

  p "EMPLOYEE ##{employee_count} INFORMATION"
  p "Name: #{name}"
  p "Stated Age: #{age_input}"
  p "Actual Age: #{actual_age}"
  p "Garlic Bread: #{garlic}"
  p "Insurance: #{insurance}"
  p "Sunshine Allergy: #{allergies}"
  p "Vampire Score: #{vampire_score}"

  if vampire_score == 1
    p "Assessment: Definitely a vampire."
  elsif vampire_score == 2
    p "Assessment: Almost certainly a vampire." 
  elsif vampire_score == 3.1 || vampire_score == 3.2
    p "Assessment: Probably a vampire." 
  elsif vampire_score == 4
    p "Assessment: Probably not a vampire."     
  else vampire_score == 5
    p "Assessment: Results inconclusive."     
  end   

end


if employees_to_process == nil || employees_to_process == 0
  p "There's always tomorrow!"
else
  p "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
end