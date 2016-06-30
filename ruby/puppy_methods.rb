# Release 0: Add Behavior to a Class
  
  class Puppy
  
    def name(puppy_name)
      puts "My name is #{puppy_name}!"
      puppy_name
    end
  
    def fetch(toy)
      puts "I brought back the #{toy}!"
      toy
    end
  
    def speak(num_of_barks) 
        (num_of_barks).times { |num_of_barks| puts("jumps!") }
        num_of_barks
    end
  
    def roll_over(command)
      puts "*rolls over*"
      command
    end
    
    def dog_years(age)
      age_in_dog_years = age * 7
      age_in_dog_years
    end
  
    def shake(command)
      puts "*lifts paw*"
      command
    end
  
    def initialize  # doesn't matter where this initialize method is placed inside this class definition
      puts "Initializing new puppy instance ..."
    end
    
  end
  
  duchess = Puppy.new
  duchess.fetch("bone")
  duchess.speak(4)
  duchess.roll_over("roll over")
  p duchess.dog_years(4)
  duchess.shake("shake")

#=====================================================#

# Release 2: Write Your Own Class, and Experiment!

# VERSION 1 

  #class Ninja
  
  # def initialize 
  #   puts "Behold, a ninja is born ..."
  # end
  
  # def karate_chops(num_of_chops)
  #   puts "The ninja jumps #{num_of_chops} times."
  # end
  
  # def roundhouse_kicks(num_of_kicks) 
  #     puts "The ninja flips #{num_of_kicks} times."
  # end
  
  #end
  
  #ninja_ary = []
  
  # 50.times do
  # ninja = Ninja.new
  # ninja_ary << ninja
  # ninja.karate_chops(2)
  # ninja.roundhouse_kicks(3)
  # end

# If I activate the following two lines and deactivate their counterparts inside 
# of the above do-loop, I can change the order of the printout.

  # ninja_ary.each { |ninja|  ninja.karate_chops(2) }
  # ninja_ary.each { |ninja|  ninja.roundhouse_kicks(3) }


# VERSION 2 (PLAYING AROUND WITH A HASH)
  
  class Ninja
    
    def initialize
    end
    
    def karate_chops(num_of_chops)
      "lashes out with #{num_of_chops} precise karate chops!"
    end
    
    def roundhouse_kicks(num_of_kicks)
      "lands #{num_of_kicks} devastating roundhouse kicks!"
    end
  
  end
  
  ninja_list = {}
  
  1.upto(50) { |ninja_identifier|
    ninja_instance = Ninja.new
    puts "Look out, it's Ninja-#{ninja_identifier} (aka #{ninja_instance})!"
    ninja_list[ninja_instance] = "Ninja-#{ninja_identifier}"
  }
  
  # experimenting with different ways of passing blocks
  ninja_list.each do |ninja_key, ninja_value| 
    puts "#{ninja_value} #{ninja_key.karate_chops(3)}"
  end
  
  
  ninja_list.each { |ninja_key, ninja_value|   
    puts "#{ninja_value} #{ninja_key.roundhouse_kicks(2)}"
  }


