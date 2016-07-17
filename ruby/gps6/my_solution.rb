# Virus Predictor

# I worked on this challenge [by Ian Lucas, with: Chris Mendoza].
# We spent [1.5] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative requires the file and points directly to it and require, relieves you of actually knowing where it is, like a gem name.

require_relative 'state_data'

class VirusPredictor

  # This initialize method creates a new object of VirusPredictor with 3 arguments expected.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # This virus_effects method is calling two other methods.
  # for release 6, since these methods that are being called and variables are accessible via putting "@" we don't need to "pass" them into the methods..
  # for release 8 we removed the print statements from the other methods (predicted_deaths and speed_of_spread) to make those methods only responsible for calculations and made virus_effects method responsible for printing the report .
  def virus_effects
    print "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  #release 7: private "closes" off methods below "private" from code trying to access methods outside the class. as opposed attr_reader or attr_accessor which allows access to individual attributes.
  private

  # This predicted_deaths method  takes 3 arguments from the state_data file and calculates the predicted death per state acording to some speed factor and prints out its prediction.
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

  end

  # This speed_of_spread method takes two arguments and calculates how fast the virus reaches new people. prints a message that looks like it appends to the predicted_deaths method.

  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

 # instead of writing code for each state to run a report we will write a loop.

STATE_DATA.each do |state_name, stats|
  newstate = VirusPredictor.new(state_name, STATE_DATA[state_name][:population_density], STATE_DATA[state_name][:population])
  newstate.virus_effects
end

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


#=======================================================================
# Reflection Section

#What are the differences between the two different hash syntaxes shown in the state_data file?
## The differences between the hash syntaxes is the use of the colon vs. rocketship.

#What does require_relative do? How is it different from require?
## require_relative requires the file and points directly to it and require, relieves you of actually knowing where it is, like a gem name.

#What are some ways to iterate through a hash?
## you can use a "do loop" or ".each" method for the hash.

#When refactoring virus_effects, what stood out to you about the variables, if anything?
## Well it was calling at the variables (ie. @) but the individual methods already called those variables so we didn't need to do it again.

#What concept did you most solidify in this challenge?
## I think the concept that was most solidified was looping through a hash in a DRY way.