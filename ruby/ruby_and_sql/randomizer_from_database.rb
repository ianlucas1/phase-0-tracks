# require gems
require 'sqlite3'

# access database of volatility quintile observations
db = SQLite3::Database.new("Volatility_Quintile_Probabilities.db")
db.results_as_hash = true

# creates a data table with one column to hold results
# of the first simulation
# create_vol_sim_table = <<-SQL
#   CREATE TABLE IF NOT EXISTS vol_sim_table(
#     sim_obs INTEGER PRIMARY KEY,
#     sim_column INT,
#   )
# SQL
# db.execute(create_vol_sim_table)

# ALTER TABLE table_name ADD column_name datatype
# may need to add ';'
# alter_vol_sim_table = <<-SQL
#   ALTER TABLE vol_sim_table
#     ADD sim_column INT
# SQL
# db.execute(alter_vol_sim_table)

# # method to add first column of simulated volatility quintiles
# def add_vol_quintile_row_1(db, sample)
#   db.execute("INSERT INTO vol_sim_table (sim_column) VALUES (?)", [sample])
# end

# def add_vol_quintile_row_n(db, sample)
#   db.execute("INSERT INTO vol_sim_table (sim_column) VALUES (?)", [sample])
# end

# volatility_quintile_ary.each do |q1_obs, q2_obs, q3_obs, q4_obs, q5_obs|
#   add_quintile_rows(db, q1_obs, q2_obs, q3_obs, q4_obs, q5_obs)
# end


# create variable to access each item in the database table called 'q_table'
Volatility_Quintile_Observations = db.execute("SELECT * FROM q_table")
Vol_Quintile_Ret_Observations = db.execute("SELECT * FROM ret_table")

# create arrays to store the column data from the database
# this will be sampled later in the program
vq_1_ary = []
vq_2_ary = []
vq_3_ary = []
vq_4_ary = []
vq_5_ary = []

rq_1_ary = []
rq_2_ary = []
rq_3_ary = []
rq_4_ary = []
rq_5_ary = []

# fill the arrays with the table's column data
Volatility_Quintile_Observations.each do |row|
 vq_1_ary  << row['q1_column']
 vq_2_ary  << row['q2_column']
 vq_3_ary  << row['q3_column']
 vq_4_ary  << row['q4_column']
 vq_5_ary  << row['q5_column']
end

Vol_Quintile_Ret_Observations.each do |row|
 rq_1_ary  << row['q1_column']
 rq_2_ary  << row['q2_column']
 rq_3_ary  << row['q3_column']
 rq_4_ary  << row['q4_column']
 rq_5_ary  << row['q5_column']
end

# test print of the array data
# p vq_1_ary
# p vq_2_ary
# p vq_3_ary
# p vq_4_ary
# p vq_5_ary

# p rq_1_ary
# p rq_2_ary
# p rq_3_ary
# p rq_4_ary
# p rq_5_ary

# define simulation class with requisite attributes so that simulations can be initiated
class Simulation

  attr_reader :simulation_number, :starting_quintile
  attr_accessor :vol_sims, :ret_sims 

  def initialize(simulation_number, starting_quintile)
    @simulation_number = simulation_number
    @starting_quintile = starting_quintile
    @vol_sims = [starting_quintile]
    @ret_sims = [nil]
  end

end

# for now, create an array to store each simulation
# it might be better to store this info in a data table
simulations = []

# initiate any number of simulations
# each simulation is numbered, which is my version of a data table primary key
# each simulation randomly assigns a "month 0" starting volatility quintile
1.upto(2) { |simulation|
  simulations << Simulation.new("#{simulation}", rand(1..5))
}

# iterate through each simulation
# based on the volatility in an index position of the vol_sims array,
# randomly sample from the quintile arrays that were extracted from
# the Volatility_Quintile_Probabilities database
simulations.each do |simulation|
  i = 0
  until i == 10
    if simulation.vol_sims[i] == 1
      simulation.vol_sims << vq_1_ary.sample
      simulation.ret_sims << rq_1_ary.sample
    elsif simulation.vol_sims[i] == 2
      simulation.vol_sims << vq_2_ary.sample
      simulation.ret_sims << rq_2_ary.sample
    elsif simulation.vol_sims[i] == 3
      simulation.vol_sims << vq_3_ary.sample
      simulation.ret_sims << rq_3_ary.sample
    elsif simulation.vol_sims[i] == 4
      simulation.vol_sims << vq_4_ary.sample
      simulation.ret_sims << rq_4_ary.sample
    else
      simulation.vol_sims << vq_5_ary.sample
      simulation.ret_sims << rq_5_ary.sample
    end
    i += 1  
  end
end

# print out to check
simulations.each { |simulation|
  puts "SIMULATION ##{simulation.simulation_number}:"
  puts "starting_quintile: #{simulation.starting_quintile}"
  puts "vol_sim: #{simulation.vol_sims}"
  puts "ret_sim: #{simulation.ret_sims}"
  puts "-----------------------------------------------"   
}

# # p simulations
