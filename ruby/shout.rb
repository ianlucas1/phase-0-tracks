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

#Release 2: Mix in a Module

