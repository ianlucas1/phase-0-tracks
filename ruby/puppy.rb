# Release 0: Design a Class

# How might you design a Puppy class? What sorts of characteristics and behavior 
# might a Puppy class involve? Using a format similar to the one we used for 
# Eyelashus Adorableus, come up with some characteristics and behavior for a Puppy 
# class. Use comments to add your class design to phase-0-tracks/ruby/puppy.rb.

# SPECIES ------------------------
# Puppy Class

# CHARACTERISTICS ----------------
# Ear length: varies
# Leg Count: 4
# Color: varies
# Name: varies
# Playful: yes

# BEHAVIOR -----------------------
# Jump
# Lick
# Scamper

# Release 1: Declare Your Class and Create an Instance in IRB

# Let's use IRB to learn more about classes.

# 1. In IRB, declare your Puppy class:

class Puppy
end

# 2. Ask your class what methods are available:
Puppy.methods
"str".methods
[].methods

# 3. Create a new instance of a Puppy and save it in a variable:

duchess = Puppy.new
fido = Puppy.new
spot = Puppy.new

# 4. We haven't taught these pups many tricks, and yet they can respond to quite 
#    a few method calls already. Run each line separately, making guesses as to 
#    what the response will look like.

spot.class
duchess == fido
fido.instance_of?(Array)
fido.instance_of?(Puppy)
spot.play_dead

# Release 2: Practice Using Class Methods and Instance Methods
# Notice that you can call methods on the class itself (Puppy.new, for example), 
# or on an instance of a class (some_puppy_instance.bark). Methods you call on a 
# class are called class methods. Methods you call on an instance are called instance methods.

# You've been using instance methods quite often already -- anytime you call a 
# method on a particular string, or array, or integer, you are calling an instance 
# method. You haven't called many class methods, but you certainly could.

# Run this code in IRB to create a new string using a class method:

# str = String.new
# str.length
# str.empty?
# str += "huh."

# In the past, we have often made new instances of the String class by declaring them 
# literally: str = "some string" ... but String.new will work too, and even takes an argument 
# for what characters you would like to put in the string. Try it:

greeting = String.new("hello")
greeting.length
greeting.upcase

# It's important to understand the difference between class methods and instance methods. 
# A class and an instance of a class are two completely separate objects. You wouldn't call 
# .new on an instance of a string, and you wouldn't call .length on the String class itself.