# RELEASE 4: SANTA SIMULATOR

class Santa

  # Santa_number and name are not to be alterable, but all the other attributes can be
  attr_reader :santa_number, :name
  attr_accessor :age, :cookie_preference, :beard_style

  # All of these attributes are randomized (except santa_number) and fed in upon initialization
  def initialize(santa_number, name, age, cookie_preference, beard_style)
    @santa_number = santa_number # I add this feature so that the list of santas at the end are easier to keep track of
    @name = name.capitalize
    @age = age # unlike in prior releases, in this release I updated age upon initialization
    @cookie_preference = cookie_preference.capitalize
    @beard_style = beard_style.capitalize 
  end
  
end

# These are the source arrays for randomizing name, cookie preference, and beard style 
# so that each santa can be a unique snowflake
names_ary = %w[ Nick Nicholas Niklaas Klaus قولا_:نيكولا‎ Նիկողայոս Nicolaus Niculae Nikola ניקאַלאַס Nikolai ニコラス ]
cookie_ary = %w[ chocolate-chip oatmeal sugar peanut-butter snickerdoodles ginger macaroons white-chocolate-macadamia-nut ]
beard_ary = %w[ clean-shaven stubble-short stubble-medium stubble-long full-beard french-fork ducktail goatee circle-bear 
                imperial extended-goatee anchor balbo verdi garibaldi dutch friendly-mutton-chops bandholz van-dyke ]

santas = [] # creates a data structure to store all the santas

# go big or go home!
1.upto(2) { |santa|
  santas << Santa.new("#{santa}", names_ary.sample, rand(0..140), cookie_ary.sample, beard_ary.sample)  
}

# I like this format for printing out results to check correctness of the program
santas.each { |santa|
  puts "ABOUT SANTA ##{santa.santa_number}:"
  puts "Name - Saint #{santa.name.capitalize}"
  puts "Age - #{santa.age}"
  puts "Favorite Cookie - #{santa.cookie_preference.capitalize}"
  puts "Beard Style - #{santa.beard_style.capitalize}"
  puts "-----------------------------------------------"   
}

#===========================================#

# RELEASES 0 through 3 (COMMENTED OUT BELOW)

#class Santa

  #def initialize(gender, ethnicity)
  #  @gender = gender
  #  @ethnicity = ethnicity 
  #  @age = 0
  #  @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    #puts "Initializing Santa instance ..."
 # end

  #def get_mad_at=(reindeer_name)
  #  if @reindeer_ranking.include?(reindeer_name)
  #      @reindeer_ranking.delete(reindeer_name)
  #      @reindeer_ranking.insert(@reindeer_ranking.length, reindeer_name) 
  #  else reindeer_name = reindeer_name
  #  end 
  #end

  #def speak
  #  puts "Ho, ho, ho! Haaaappy holidays!"
  #end

  #def eat_milk_and_cookies(cookie_type)
  #  puts "That was a good #{cookie_type}!" 
  #end

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

#end

#santa = Santa.new("Male", "White")
#santa.speak
#santa.eat_milk_and_cookies("snicker doodle")
#santa.about

#===========================================#

#santas = []
#santas << Santa.new("female", "black")
#santas << Santa.new("female", "Latino")
#santas << Santa.new("bigender", "white")
#santas << Santa.new("male", "Japanese")
#santas << Santa.new("female", "prefer not to say")
#santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
#santas << Santa.new("N/A", "N/A")

#santas[0].about # shows information about the santa at index position zero BEFORE making changes

#santas[0].celebrate_birthday = true #testing setter method

#santas[0].change_gender = "Male" #testing setter method

#santas[0].get_mad_at = "Prancer" #testing setter method

#santas[0].age = 2 #testing attr_accessor method

#santas[0].gender = "Male" #testing attr_accessor method

#santas[0].about # shows information about the santa at index position zero AFTER making changes

#p santas[0].age #testing getter/attr_accessor method

#p santas[0].ethnicity #testing getter/attr_reader method

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