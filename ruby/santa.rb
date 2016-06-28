class Santa

  def initialize
    puts "Initializing Santa instance ..."
  end

  def speak(converse_string)
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!" 
  end

end

santa = Santa.new
santa.eat_milk_and_cookies("snicker doodle")
santa.speak("Hi, Santa!")
 