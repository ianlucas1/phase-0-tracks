class Santa

  attr_reader :ethnicity

  attr_accessor :age, :gender

  def initialize(gender, ethnicity)
    @gender = gender
    @ethnicity = ethnicity 
    @age = 0
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    #puts "Initializing Santa instance ..."
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!" 
  end

  def get_mad_at=(reindeer_name)
    if @reindeer_ranking.include?(reindeer_name)
        @reindeer_ranking.delete(reindeer_name)
        @reindeer_ranking.insert(@reindeer_ranking.length, reindeer_name) 
    else reindeer_name = reindeer_name
    end 
  end

  def about 
    puts "ABOUT SANTA:"
    puts "gender - #{@gender}"
    puts "ethnicity - #{@ethnicity}"
    puts "age - #{@age}"
    puts "reindeer ranking - #{@reindeer_ranking}"
    puts "----------------------"
  end

  #def initialize(name, fave_cookie)
  #  @name = name
  #  @fave_cookie = fave_cookie
  #end

  #def about
  #  puts "name: #{@name}"
  #  puts "favorite cookie: #{@fave_cookie}"
  #end

  #def introduction
  #  puts "Ho ho ho, my name is Saint #{@name} and my favorite kind of cookie is #{@fave_cookie}."
  #end

# GETTER METHODS

  #def age
  #  @age
  #end

  #def ethnicity
  #  @ethnicity
  #end

# SETTER METHODS

  #def change_gender=(new_gender)
  #  @gender = new_gender
  #end
  
  #def celebrate_birthday=(new_age)
  #  @age += 1
  #end

end

#santa = Santa.new("Male", "White")
#santa.speak
#santa.eat_milk_and_cookies("snicker doodle")
#santa.about

#===========================================#

santas = []
santas << Santa.new("female", "black")
santas << Santa.new("female", "Latino")
santas << Santa.new("bigender", "white")
santas << Santa.new("male", "Japanese")
santas << Santa.new("female", "prefer not to say")
santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
santas << Santa.new("N/A", "N/A")

santas[0].about # shows information about the santa at index position zero BEFORE making changes

#santas[0].celebrate_birthday = true #testing setter method

#santas[0].change_gender = "Male" #testing setter method

santas[0].get_mad_at = "Prancer" #testing setter method

santas[0].age = 2 #testing attr_accessor method

santas[0].gender = "Male" #testing attr_accessor method

santas[0].about # shows information about the santa at index position zero AFTER making changes

p santas[0].age #testing getter/attr_accessor method

p santas[0].ethnicity #testing getter/attr_reader method

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

#santas = []
#names_ary = ["Niklaas", "Nicolau", "Mikk"]
#fave_cookies_ary = ["chocolate chip", "sugar", "oatmeal"]

#names_ary.length.times do |i|
#santas << Santa.new(names_ary[i], fave_cookies_ary[i])
#end

#p santas

#santas.each { |santa|  santa.introduction }

#===========================================#

  

#Add three attribute-changing (setter) methods to your Santa class:
# 1) celebrate_birthday should age Santa by one year.
# 2) get_mad_at can take a reindeer's name as an argument, 
#    and move that reindeer in last place in the reindeer rankings.
# 3) The @gender attribute should have a setter method that allows @gender 
#    to be reassigned from outside the class definition.

#Add two "getter" methods as well:
# 1) The method age should simply return @age.
# 2) The method ethnicity should return @ethnicity.
# 3) Update your driver code to test your work.




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





