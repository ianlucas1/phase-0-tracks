# RELEASE 0: DESIGN A CLASS

  # Program name:  Shock and Awe, A War Simulator 

  # (side comment:  I haven't played a video game since Mario Kart in the mid-1990s 
  #  and I'm not exactly a military expert)

  # Requirement 1: three attributes (using at least two data types) 
  # whose values will vary from instance to instance (example: age)

    # Initialize a military organization with the following attributes
    # A1: Branch (string like Air Force, Army, Navy, Marines, Coast Guard)
    # A2: Number of personnel (random integer between 20 and 1 million)
    # A3: Weapon system types (string like Planes, Ships, Guns)
    # A4: Annual Budget (random boolean where true = a high budget and false = a low budget)

  # Requirement 2: three methods, at least one of which takes an argument

    # M1: Wellness (string like R&R, offering-transition-assistance, upgrading-housing)
    # M2: Readiness (string like train, equip, stage supplies, spin-up)
    # M3: Combat Actions (string like deploy with a number of personnel, show-of-presence, 
    #     surgical-strike, shock-and-awe, battle-damage-assessment)

  # Randomly choose branch, randomly choose conditional weapons systems, give a score, provide BDA

#====================================#

# RELEASE 1:  WRITE YOUR CLASS

# BUSINESS LOGIC

class Force

  attr_reader :branch_type, :force_number
  attr_accessor :num_of_personnel, :weapon_system

  def initialize(force_number, branch_type, num_of_personnel, weapon_system)
    @force_number = force_number
    @branch_type = branch_type
    @num_of_personnel = num_of_personnel
    @weapon_system = weapon_system
    #@annual_budget = annual_budget
  end

  def karate_chops(num_of_chops)
    puts "The ninja chops #{num_of_chops} times."
  end

  def roundhouse_kicks(num_of_kicks) 
      puts "The ninja roundhouse kicks #{num_of_kicks} times."
  end

end

fighting_force_ary = []

#====================================#

# RELEASE 1:  USE YOUR CLASS IN A PROGRAM

# USER INTERFACE

force_count = 1

loop do

  puts "What kind of branch do you want? (e.g. Air Force, Army, Navy, Marines, or Coast Guard)"
    branch_type = gets.chomp.downcase

    #if branch_type != "air force" || branch_type != army || branch_type != navy || branch_type != marines || branch_type != "coast guard"
     # puts "I'm sorry, that's not a valid branch.  You'll have to try again."
    #else
     # puts "Okay, great."
    #end


  puts "Now we need to know if you want a large force or a small force.  Enter a number of personnel:"
    num_of_personnel = gets.to_i


  puts "What kind of weapon system would you like?  Enter 'planes', 'ships', or 'tanks'."
    weapon_system = gets.chomp


  fighting_force_ary << Force.new("#{force_count}", branch_type, num_of_personnel, weapon_system)

  
  puts "---------------------------------" 
  puts "Summary of force ##{force_count}:"
  puts "Branch - #{branch_type.capitalize}"
  puts "Personnel - #{num_of_personnel}"
  puts "Weapon System - #{weapon_system.capitalize}"
  puts "---------------------------------" 


  puts "Do you want to build another fighting force?  (valid inputs:  yes, no)"
    build_another_force = gets.chomp

  break if build_another_force == 'no'


  force_count += 1

end

  puts "---------------------------------"
  
  fighting_force_ary.each { |force|  
    puts "FORCE ##{force.force_number} STATUS:"
    puts "Branch - #{force.branch_type.capitalize}"
    puts "Personnel - #{force.num_of_personnel}"
    puts "Weapon System - #{force.weapon_system.capitalize}"
    puts "---------------------------------"   
  }


















# Arrays for initialization
    Branch_ary = %w[ Air Force, Army, Navy, Marines, Coast Guard ]
    Weapon_system_ary = %w[ planes ships guns ]

#1.upto(3) { |force|
#  fighting_force_ary << Force.new("#{force}", Branch_ary.sample, rand(20..1000000), Weapon_system_ary.sample, [true, false].sample)  
#}


  #santas[0].age = 2 #testing attr_accessor method
  #santas[0].gender = "Male" #testing attr_accessor method
  #p santas[0].ethnicity #testing getter/attr_reader method
