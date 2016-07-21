# require gems
require 'sqlite3'

# access database of volatility quintile observations
db = SQLite3::Database.new("Volatility_Quintile_Probabilities.db")
db.results_as_hash = true

# create variable to access each item in the database table called 'q_table'
Volatility_Quintile_Observations = db.execute("SELECT * FROM q_table")

# create arrays to store the column data from the database
# this will be sampled later in the program
q_1_ary = []
q_2_ary = []
q_3_ary = []
q_4_ary = []
q_5_ary = []

# fill the arrays with the table's column data
Volatility_Quintile_Observations.each do |row|
 q_1_ary  << row['q1_column']
 q_2_ary  << row['q2_column']
 q_3_ary  << row['q3_column']
 q_4_ary  << row['q4_column']
 q_5_ary  << row['q5_column']
end

# uncomment the following p commands to see the array data
# p q_1_ary
# p q_2_ary
# p q_3_ary
# p q_4_ary
# p q_5_ary

# define simulation class with requisite attributes so that simulations can be initiated
class Simulation

  attr_reader :simulation_number, :starting_quintile
  attr_accessor :sims

  def initialize(simulation_number, starting_quintile)
    @simulation_number = simulation_number
    @starting_quintile = starting_quintile
    @sims = [starting_quintile]
  end

end

# for now, create an array to store each simulation
### it might be better to store this info in a data table ###
simulations = []

# initiate any number of simulations
# each simulation is numbered, which is my version of a data table primary key
# each simulation randomly assigns a "month 0" starting volatility quintile
1.upto(10000) { |simulation|
  simulations << Simulation.new("#{simulation}", rand(1..5))
}

# iterate through each simulation
# based on the volatility in an index position of the sims array,
# randomly sample from the quintile arrays that were extracted from
# the Volatility_Quintile_Probabilities database
simulations.each do |simulation|
  i = 0
  until i == 180
    if simulation.sims[i] == 1
      simulation.sims << q_1_ary.sample
    elsif simulation.sims[i] == 2
      simulation.sims << q_2_ary.sample
    elsif simulation.sims[i] == 3
      simulation.sims << q_3_ary.sample
    elsif simulation.sims[i] == 4
      simulation.sims << q_4_ary.sample
    else
      simulation.sims << q_5_ary.sample
    end
    i += 1  
  end
end

# print out to check
simulations.each { |simulation|
  puts "SIMULATION ##{simulation.simulation_number}:"
  puts "starting_quintile: #{simulation.starting_quintile}"
  puts "sim: #{simulation.sims}"
  puts "-----------------------------------------------"   
}

# p simulations
