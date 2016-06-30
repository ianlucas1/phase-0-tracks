# Release 1: Write a Simple Module

# R1.1 Declare your module. The syntax for declaring a 
# module is pretty simple:
    
  #module Shout

  #  def self.yell_angrily(words) # R1.4
  #    words + "!!!" + " :("
  #  end

  #  def self.yelling_happily(words) # R1.4
  #    words + "!" + " :D"
  #  end

  #end

# R1.5 Add driver code underneath your module declaration 
# that calls both of your module methods. 

# For some inexplicable reason, when I run the file in terminal
# each of the following method calls print out twice
# require_relative 'shout'
  # p Shout.yell_angrily("Argh")
  # p Shout.yelling_happily("Yay")

#======================================#

# Release 3: Convert a Standalone Module to a Mixin

# Comment out the old code in shout.rb, and make a mixin 
# version of the Shout module instead.

    module Shout

        def yell_angrily(words)
            words + "!!!" + " :("
        end

        def yelling_happily(words)
            words + "!" + " :D"
        end

    end

# Write two classes representing anything that might shout, 
# and include the Shout module in those classes.

    class Bemoan
        include Shout
    end

    class Celebrate
        include Shout
    end

# Test your work by adding driver code at the bottom of the 
# file that instantiates instances of your classes and calls 
# the two module methods on each instance.

    me_angry = Bemoan.new
    p me_angry.yell_angrily("Why, God?")

    me_happy = Celebrate.new
    p me_happy.yelling_happily("Take that")

