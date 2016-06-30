# RELEASE 0: DESIGN A CLASS

    # Program name:  Military Orders 

    # Requirement 1: three attributes (using at least two data types) whose values will vary from instance to instance (example: age)

        # Initialize a military organization with the following attributes
        # A1: Branch (a string like Air Force, Army, Navy, Marines, Coast Guard)
        # A2: Number of personnel (an integer)
        # A3: Action to take (a string like train, deploy, rest, etc.)
        # A4: Name of operation
        # A5: The number of the unit (I like this for easy reference/record keeping)

    # Requirement 2: three methods, at least one of which takes an argument

        # M1: Branch (a method inside the class that prompts user to select the branch of the service)
        # M2: Personnel (a method inside the class gather the number of troops to which the order will apply)
        # M3: Actions (a method inside the class get an input about what kind of action the troops should perform)
        # M4: Operation (not a method, actually; I will use an interface with the class to let the user provide this input)
        # M5: Change (a method inside the class that takes an argument and allows a user to make any kind or number of changes to prior inputs)

#====================================#

# RELEASE 1: WRITE YOUR CLASS

# BUSINESS LOGIC

class Unit

    attr_reader :unit_number
    attr_accessor :branch_type, :op_name, :num_of_personnel, :action_to_take

    def initialize(unit_number)
        @unit_number = unit_number
        @branch_type = nil
        @op_name = nil
        @num_of_personnel = nil
        @action_to_take = nil
    end

    def branch
        puts "Which service branch do you have an order for?"
        puts "[1]=Air Force [2]=Army [3]=Coast Guard [4]=Marines [5]=Navy."  
            branch_input = gets.downcase.chomp
        
        if branch_input == "1" || branch_input == "air force"
            @branch_type = "Air Force" 
            
        elsif branch_input == "2" || branch_input == "army"
            @branch_type = "Army" 
            
        elsif branch_input == "3" || branch_input == "coast guard"
            @branch_type = "Coast Guard" 
            
        elsif branch_input == "4" || branch_input == "marines"
            @branch_type = "Marines" 
            
        elsif branch_input == "5" || branch_input == "navy"
            @branch_type = "Navy" 
            
        else
            puts "I'm sorry, that's not a valid input."
            branch
        end
    end

    def personnel
        puts "How many #{branch_type.capitalize} personnel will your order apply to?"
        puts "Enter a whole number with no commas (e.g. 10000 rather than 'ten thousand')."
            num_of_personnel = gets.to_i

        if num_of_personnel == 0
            puts "I'm sorry, that didn't register. Please enter how many personnel one more time as a number like 1000."
            personnel
        else 
            @num_of_personnel = num_of_personnel.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
        end 
    end

    def action  
        puts "What would you like this #{num_of_personnel} person unit to do?"
        puts "[1]=equip [2]=train [3]=deploy [4]=fight [5]=rest"
            action_input = gets.downcase.chomp
          
        if action_input == "1" || action_input == "equip"
            @action_to_take = "equip" 
            
        elsif action_input == "2" || action_input == "train"
            @action_to_take = "train" 
            
        elsif action_input == "3" || action_input == "deploy"
            @action_to_take = "deploy" 
            
        elsif action_input == "4" || action_input == "fight"
            @action_to_take = "fight" 
            
        elsif action_input == "5" || action_input == "rest"
            @action_to_take = "rest" 
            
        else
           puts "I'm sorry, that's not a valid input."
           action
        end
    end

    def change(change_input)
        puts "[1]=change branch [2]=change number of personnel [3]=change action [4]=rename operation"   
            what_to_change = gets.downcase.chomp

        if what_to_change == "1" || what_to_change == "branch"
            branch
          
        elsif what_to_change == "2" || what_to_change == "personnel" || what_to_change == "number of personnel"
            personnel
          
        elsif what_to_change == "3" || what_to_change == "action"
            action 
          
        elsif what_to_change == 4 || what_to_change == "operation" || what_to_change == "rename operation" || what_to_change == "operation name"
            puts "Enter a new operation name."
                op_name = gets.upcase.chomp
                @op_name = op_name 
        
        else
            puts "I'm sorry, that's not a valid input."
            change("try again")
        end      

          puts "Copy. #{num_of_personnel} #{branch_type.capitalize} personnel will #{action_to_take} as part of the operation." 
    end

end

#====================================#

# RELEASE 2: USER YOUR CLASS IN A PROGRAM

# USER INTERFACE

unit_ary = []
unit_count = 1

puts "Good day, commander!"

loop do
    unit = Unit.new("#{unit_count}")
    unit_ary << unit
    unit.branch
    unit.personnel 
    unit.action

    puts "Please give this operation a name of your choosing. (e.g. 'Polishing Rubies' or 'Shock and Awe')"
        op_name = gets.chomp.upcase
        unit.op_name = op_name

    puts "Roger that. During OP #{unit.op_name}, #{unit.num_of_personnel} #{unit.branch_type.capitalize} personnel will #{unit.action_to_take}."

    loop do
        puts "Are there any changes to make to this order? Enter 'yes' or 'no'."
            change_input = gets.chomp

        if change_input == "no"
            break
        
        elsif change_input == "yes"
            unit.change(change_input)
        
        else
            puts "I'm sorry, that's not a valid input."
        end
    end

        puts "Do you want to build another fighting unit? Enter 'yes' or 'no'."
        build_another_unit = gets.downcase.chomp
        
        break if build_another_unit == "no"

    unit_count += 1
end
    puts ""
    puts "Very good, ma'am. Here is a summary of today's order:"
    puts ""
    unit_ary.each { |unit|  
        puts "UNIT ##{unit.unit_number}:"
        puts "Branch - #{unit.branch_type.capitalize}"
        puts "Operation - #{unit.op_name}"
        puts "Personnel - #{unit.num_of_personnel}"
        puts "Current Order - #{unit.action_to_take.capitalize}"
        puts "-----------------------"
    }
