class Santa

  #def initialize(gender, ethnicity)
    #@gender = gender
    #@ethnicity = ethnicity 
    #@age = 0
    #puts "Initializing Santa instance ..."
  #end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!" 
  end

  def reindeer_ranking
    reindeer_ranking_ary = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    put "#{reindeer_ranking}"
  end

  #def about 
  #  puts "gender: #{@gender}"
  #  puts "ethnicity: #{@ethnicity}"
  #  puts "age: #{@age}"
  #end

  def initialize(name, fave_cookie)
    @name = name
    @fave_cookie = fave_cookie
  end

  def about
    puts "name: #{@name}"
    puts "favorite cookie: #{@fave_cookie}"
  end

  def introduction
    puts "Ho ho ho, my name is Saint #{@name} and my favorite kind of cookie is #{@fave_cookie}."
  end

end

#santa = Santa.new("Male", "White")
#santa.speak
#santa.eat_milk_and_cookies("snicker doodle")
#santa.about

#===========================================#

#santas = []
#santas << Santa.new("agender", "black")
#santas << Santa.new("female", "Latino")
#santas << Santa.new("bigender", "white")
#santas << Santa.new("male", "Japanese")
#santas << Santa.new("female", "prefer not to say")
#santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
#santas << Santa.new("N/A", "N/A")
#p santas
#santas[0].about

#===========================================#

#santas = []
#example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
#example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

#example_genders.length.times do |i|
#  santas << Santa.new(example_genders[i], example_ethnicities[i])
#end

#p santas
#santas[0].about

#===========================================#

santas = []
names_ary = ["Niklaas", "Nicolau", "Mikk"]
fave_cookies_ary = ["chocolate chip", "sugar", "oatmeal"]

names_ary.length.times do |i|
santas << Santa.new(names_ary[i], fave_cookies_ary[i])
end

#p santas

santas.each { |santa|  santa.introduction }

#===========================================#

Add three attribute-changing methods to your Santa class:

celebrate_birthday should age Santa by one year.
get_mad_at can take a reindeer's name as an argument, and move that reindeer in last place in the reindeer rankings. Vixen knows what he did.
The @gender attribute should have a setter method that allows @gender to be reassigned from outside the class definition.
Add two "getter" methods as well:

The method age should simply return @age.
The method ethnicity should return @ethnicity.
Update your driver code to test your work.




#names_ary.each do |name|
  #puts "Adding a Santa named #{name}."
  #santas << Santa.new(name, fave_cookies_ary)
  #puts "There are now #{santas.length} Santas in the array."
  #puts "----"
#end

#fave_cookies_ary.each do |fave_cookie|
  #puts "Adding a Santa named #{name}."
  #santas.push(fave_cookie)
  #puts "There are now #{santas.length} Santas in the array."
  #puts "----"
#end





