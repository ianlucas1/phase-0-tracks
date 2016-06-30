# C6.5 Release 2: Mix in a Module

# R2.1 In phase-0-tracks/ruby/flight.rb, 
# declare classes for a bird and a plane

# R2.2 Now, let's write a Flight module. We'll 
# need to do that above our class declarations, at 
# the top of the file.

# R2.3 Add your module to your Bird and Plane classes

# R2.4 Now, instances of our Bird and Plane classes will 
# have the ability to take off. See for yourself by adding 
# this code to the bottom of the file and running it from 
# the command line

module Flight
  
  def take_off(altitude) # don't need 'self' when module is a mixin
    puts "Taking off and ascending until reaching #{altitude} ..."
  end

end

class Bird
  include Flight
end

class Plane
  include Flight
end

bird = Bird.new
bird.take_off(800)

plane = Plane.new
plane.take_off(30000)