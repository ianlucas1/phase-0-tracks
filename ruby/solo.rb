# RELEASE 0: DESIGN A CLASS

  # Program name:  Build a Military 

  # Requirement 1: three attributes (using at least two data types) 
  # whose values will vary from instance to instance (example: age)

    # Initialize a military organization with the following attributes
    # A1: Branch (a string like Air Force, Army, Navy, Marines, Coast Guard)
    # A2: Number of personnel (an integer)
    # A3: Weapon system types (a string like Planes, Ships, Guns)

  # Requirement 2: three methods, at least one of which takes an argument

    # M1: Wellness (string like R&R, offering-transition-assistance, upgrading-housing)
    # M2: Readiness (string like train, equip, stage supplies, spin-up)
    # M3: Combat Actions (string like deploy with a number of personnel, show-of-presence, 
    #     surgical-strike, shock-and-awe, battle-damage-assessment)

#====================================#

# RELEASE 1:  WRITE YOUR CLASS

# BUSINESS LOGIC

class Force

  attr_reader :force_number, :branch_type
  attr_accessor :num_of_personnel, :action_to_take, :op_name

  def initialize(force_number)
    @force_number = force_number
    @branch_type = nil
    @num_of_personnel = nil
    @action_to_take = nil
    @op_name = nil
  end

  def branch
    loop do
    puts "Which branch do you have an order for? Enter '1' for the Air Force, '2' for the Army, '3' for the Coast Guard, '4' for the Marines, or '5' for the Navy."  
      branch_input = gets.to_i
      if branch_input == 1
        @branch_type = "Air Force" 
        break
      elsif branch_input == 2
        @branch_type = "Army" 
        break
      elsif branch_input == 3
        @branch_type = "Coast Guard" 
        break
      elsif branch_input == 4
        @branch_type = "Marines" 
        break
      elsif branch_input == 5
        @branch_type = "Navy" 
        break
      else
        puts "I'm sorry, that's not a valid input."
      end
    end
  end

  def personnel
    loop do

      puts "How many #{branch_type.capitalize} personnel will this affect?"
        num_of_personnel = gets.to_i

      if num_of_personnel == 0
        puts " "
        puts "I'm sorry, please enter how many personnel one more time as a number like 1000."
        puts " "
      else  
        @num_of_personnel = num_of_personnel.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
        break
      end 

    end
  end

  def action
    loop do
      puts "What would you like this force to do next? Enter '1' for equip, '2' for train, '3' for deploy, '4' for fight, or '5' for rest."
        action_input = gets.to_i
        
        if action_input == 1
          @action_to_take = "equip" 
          break
        elsif action_input == 2
          @action_to_take = "train" 
          break
        elsif action_input == 3
          @action_to_take = "deploy" 
          break
        elsif action_input == 4
          @action_to_take = "fight" 
          break
        elsif action_input == 5
          @action_to_take = "rest" 
          break
        else
          puts "I'm sorry, that's not a valid input."
        end
    end
  end

  def change(change_input)
    loop do
    puts "Enter '1' to change the branch, '2' to change the number of personnel, '3' to change the action they take, or '4' to rename the operation."
    what_to_change = gets.to_i

      if what_to_change == 1
          branch
          break
      elsif what_to_change == 2
          personnel
          break
      elsif what_to_change == 3
          action 
          break
      elsif what_to_change == 4
          puts "Please give this operation a new name."
            op_name = gets.chomp.upcase
            @op_name = op_name 
          break
      else
          puts "I'm sorry, that's not a valid input."
      end      
    end
    puts " "
    puts "I copy that, in OP #{op_name}, #{num_of_personnel} #{branch_type.capitalize} personnel will #{action_to_take}." 
  end

end

#====================================#

# USER INTERFACE

force_ary = []
force_count = 1

puts "Good day, commander!"

loop do

  force = Force.new("#{force_count}")
  
  force_ary << force
  
  puts " "

  force.branch
  
  puts " "
  
  force.personnel
  
  puts " "
  
  force.action
  
  puts " "
  
  puts "Please give this operation a name of your choosing. (e.g. 'Polishing Rubies' or 'Shock and Awe')"
    op_name = gets.chomp.upcase

  force.op_name = op_name

  puts " "

  puts "Roger that. During OP #{force.op_name}, #{force.num_of_personnel} #{force.branch_type.capitalize} personnel will #{force.action_to_take}."

  loop do

    puts " "

    puts "Are there any changes to make to this order? Enter 'yes' or 'no'."
      change_input = gets.chomp

    if change_input == "no"
      break
    elsif change_input == "yes"
      force.change(change_input)
    else
      puts "I'm sorry, that's not a valid input."
    end

  end

  puts " "

  puts "Do you want to build another fighting force?  (valid inputs:  yes, no)"
    build_another_force = gets.chomp

  break if build_another_force == 'no'

  force_count += 1

end

  puts " "

  puts "Very good, sir. Here is a summary of today's order:"
  
  puts " "

  force_ary.each { |force|  
    puts "UNIT ##{force.force_number}:"
    puts "Op Name - #{force.op_name}"
    puts "Branch - #{force.branch_type.capitalize}"
    puts "Personnel - #{force.num_of_personnel}"
    puts "Current Order - #{force.action_to_take.capitalize}"
    puts "-----------------------"   
  }
