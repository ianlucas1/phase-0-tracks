# TABLE OF CONTENTS
# 1) INTRODUCTION
# 2) USER INTERFACE
# 3) BUSINESS LOGIC
# 4) PRINTOUTS

# ============================================================================
# ============================================================================
# ============================= INTRODUCTION =================================
# ============================================================================
# ============================================================================

# This program accesses financial data from pre-existing tables   
# stored inside the Simulations.db that was built in the 
# excel_to_db_RUN_FIRST.rb file - please make sure to run that 
# file before this one.

# The purpose of this program is to perform a Monte Carlo simulation 
# employing "re-sampling with replacement" where the sampling is based  
# on probability that an ex ante financial return distribution is 
# governed by prior period return volatility - you don't have to know
# or care what that means, but it mattes in my little corner of the
# finance world.

# The output of this program is a new data table that contains the 
# results of all the simulations performed.

# I believe it is better to have a long simulation in a single column
# from which non-overlapping samples can be studied, but to show the
# work that I put into figuring out how to run SQL commands with Ruby,
# the final simulation table puts separate simulations side-by-side
# in multiple columns.

# The way I ultimately got to that output was by creating a series of 
# aggregate tables using CREATE TABLE and JOIN commands together and
# then discarding all the but last one, which contained all the simulations;
# I believe there are more efficient ways of achieving the same effect,
# but I put more time than I would like to admit into this solution, so
# this is the one I'm going with for the time being.



# ============================================================================
# ============================================================================
# ============================= USER INTERFACE ===============================
# ============================================================================
# ============================================================================

# This interface is super basic because the program is for my own personal use, 
# negating the need for intricate user input processing, and because I have put  
# great effort into user interfaces in prior challenges; this program is about 
# getting an object oriented language to interact with a database, so that is 
# where I focused my attention.

puts "\n"
puts "Welcome to the Monte Carlo financial return simulator! \n\n"
puts "Please enter the number of simulations to run, as a whole number (e.g. 10)"
number_of_sims = gets.chomp.to_i

puts "\n"
puts "Now, enter how long each simulation should be, in terms of months (e.g. 12)"
length_of_sims = gets.chomp.to_i
puts "\n"


# ============================================================================
# ============================================================================
# ============================= BUSINESS LOGIC ===============================
# ============================================================================
# ============================================================================

require 'sqlite3'

# First, access database of volatility and return quintile tables:

# Please note that Simulations.db is the output of excel_to_db_RUN_FIRST.rb,
# which must be run before the commands in this file will work.

db = SQLite3::Database.open "Simulations.db"
db.results_as_hash = true

# Create variables to access each item in the database tables:

volatility_table = db.execute("SELECT * FROM volatility_table")
return_table = db.execute("SELECT * FROM return_table")

# Create arrays to store the column data from the database
# (these arrays will be sampled later in the program):

vol_q_1_ary = []
vol_q_2_ary = []
vol_q_3_ary = []
vol_q_4_ary = []
vol_q_5_ary = []

ret_q_1_ary = []
ret_q_2_ary = []
ret_q_3_ary = []
ret_q_4_ary = []
ret_q_5_ary = []

# Fill the arrays with the table's column data:

volatility_table.each do |row|
  vol_q_1_ary << row['quintile_1']
  vol_q_2_ary << row['quintile_2']
  vol_q_3_ary << row['quintile_3']
  vol_q_4_ary << row['quintile_4']
  vol_q_5_ary << row['quintile_5']
end

# The return table contains some nil values,
# so those are removed in this process:

return_table.each do |row|
  if row['quintile_1'] != nil
    ret_q_1_ary << row['quintile_1']
  end
  if row['quintile_2'] != nil
    ret_q_2_ary << row['quintile_2']
  end
  if row['quintile_3'] != nil
    ret_q_3_ary << row['quintile_3']
  end
  if row['quintile_4'] != nil
    ret_q_4_ary << row['quintile_4']
  end
  if row['quintile_5'] != nil
    ret_q_5_ary << row['quintile_5']
  end
end

# a. Define simulation class with requisite attributes to run the simulations
#    sim_num is my version of a data table primary key for keeping track of
#    simulations added to the sim_ary.
# b. vol_sim is an array into which the re-sampled volatility values are added.
# c. ret_sim is an array into which the re-sampled return values are added.
# d. vol_sim is seeded with an initially randomized quintile value from 1 to 5.
# e. vol_sim values dictate which return distribution quintile that ret_sim  
#    values are drawn from.
# f. because the first ret_sim value is nil, the printout at the end has simulation
#    values that are blank for obs 1 (where 'obs' is short for 'observation');  
#    because obs 1 really corresponds to month zero, this is not an error; rather,
#    it is an artifact of how the primary key counter starts at 1 instead of 0

class Simulation

  attr_reader :sim_num
  attr_accessor :vol_sim, :ret_sim 

  def initialize(sim_num)
    @sim_num = sim_num
    @vol_sim = [rand(1..5)]
    @ret_sim = [nil]
  end

end

# Create an array to store each simulation:

sim_ary = []

# Create array to store table names:

# This is used for iteratively adding simulation columns
# to an aggregated data table after all the simulations
# have been run.

table_ary = []

# Initialize simulation instances and assign the simulation number:

sim_num = 1

number_of_sims.times do
  sim_ary << Simulation.new(sim_num)
  sim_num += 1
end

# Next, iteratively build each simulation's volatility and return array:

# The 'a' variable is used several times in the loop to differentiate
# each simulation; I could have used 'sim_num', but it was visually 
# confusing to do so, so I just went with a simple variable name.

a = 1

sim_ary.each do |sim|

  # The if-else logic randomly draws from the volatility quintile 
  # arrays and the return quintile arrays that were populated with data 
  # imported from the volatility_table and the return_table contained in 
  # the Simulation database.

  # Beginning with a randomly assigned number 1 - 5 (corresponding to
  # the five quintile columns in those tables), the program samples
  # the volatility array, which itself contains quintile values based
  # on the previously assessed likelihood that an observation from
  # a given quintile will occur in the subsequent period.

  # The number that the 'b' counter goes up to represents months 
  # that determine the length of the simulation.

  b = 0

  until b == length_of_sims
    if sim.vol_sim[b] == 1
      sim.vol_sim << vol_q_1_ary.sample
      sim.ret_sim << ret_q_1_ary.sample
    elsif sim.vol_sim[b] == 2
      sim.vol_sim << vol_q_2_ary.sample
      sim.ret_sim << ret_q_2_ary.sample
    elsif sim.vol_sim[b] == 3
      sim.vol_sim << vol_q_3_ary.sample
      sim.ret_sim << ret_q_3_ary.sample
    elsif sim.vol_sim[b] == 4
      sim.vol_sim << vol_q_4_ary.sample
      sim.ret_sim << ret_q_4_ary.sample
    else
      sim.vol_sim << vol_q_5_ary.sample
      sim.ret_sim << ret_q_5_ary.sample
    end
    b += 1  
  end

  # String command to create a table for each simulation to store 
  # the values sampled from the series of return arrays:

  create_vol_prob_table = 
    "CREATE TABLE IF NOT EXISTS Sim_#{a}(
    obs INTEGER PRIMARY KEY,
    sim_#{a} INT
    );"

  # Run the SQLite command to create create the simulation table:

  db.execute(create_vol_prob_table)

  # Add Sim_a's to the table_ary where Sim_a corresponds to the name
  # of the data tables that store each simulation's output:

  table_ary << "Sim_#{a}"
    
  # method to insert each sampled return observation into the simulation table
  def add_sim(db, obs, a)
    db.execute("INSERT INTO Sim_#{a} (sim_#{a}) VALUES (?)", [obs])
  end

  # create an object that holds all the simulation values that will be inserted
  # into the individual simulation table:
  
  ret_quintile_ary = sim.ret_sim

  # execute the insertion of each simulation value, thus completing one simulation
  # before looping to the next simulation:

  ret_quintile_ary.each do |obs|
    add_sim(db, obs, a)
  end

  a += 1
end

# Create an simulation data table that combines the results of
# the first two simulations:

# I found that I had to do this step before I could iteratively
# construct a data table that aggregates all of the simulations,
# which is accomplished in the loop that follows this step

db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS simulation_table_1
    AS SELECT *
    FROM #{table_ary[0]}
    JOIN #{table_ary[1]}
    ON #{table_ary[0]}.obs = #{table_ary[1]}.obs;
  SQL

# Next, I iteratively build simulation tables that aggregate all of the simulations.

# In subsequent steps, I drop all the data tables that serve as 
# temporary files that would otherwise clutter the database.

# There are redundant 'obs' (short for 'observation') columns in the simulation tables; 
# there is no SQLite command to drop columns that I could find.

# When I print out a sample of columns from the ultimate simulation table,
# I omit the redundant columns for convenience.

j = 2
k = 1
until j == table_ary.length
  db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS simulation_table_#{j}
    AS SELECT *
    FROM simulation_table_#{k}
    JOIN #{table_ary[j]}
    ON simulation_table_#{k}.obs = #{table_ary[j]}.obs;
  SQL
  j += 1
  k += 1
end

# Drop all the individual sim tables, which are no longer needed:

l = 0
until l == sim_ary.length
  db.execute <<-SQL
      DROP TABLE #{table_ary[l]};
  SQL
  l += 1
end

# Drop all but the last simulation_table:

m = sim_ary.length - 2
until m == 0
  db.execute <<-SQL
      DROP TABLE simulation_table_#{m};
  SQL
  m -= 1
end

# Rename the final simulation_table:

# IMPORTANT: Because of this step, if you want to re-run the simulations, 
# the Simulation.db file needs to be deleted and the excel_to_db_RUN_FIRST.rb 
# program needs to be run again before executing this program; if you try to 
# run this program again without taking those steps, there will be no file 
# to rename and an error will be returned.

n = sim_ary.length - 1
db.execute "ALTER TABLE simulation_table_#{n} RENAME TO simulation_table;"



# ============================================================================
# ============================================================================
# ================================ PRINTOUTS =================================
# ============================================================================
# ============================================================================

puts "LIST OF TABLES IN THE DATABASE:"
db = SQLite3::Database.open "Simulations.db"
rows = db.execute <<-SQL
  SELECT name FROM sqlite_master
  WHERE type = 'table'
  ORDER BY name;
SQL
rows.each do |row|
  puts row
end
puts "\n"

puts "THE FIRST 5 SIMULATIONS IN THE SIMULATION TABLE:"
db = SQLite3::Database.open "Simulations.db"
rows = db.execute2 "SELECT * FROM simulation_table"
rows.each do |row|
  puts "%2s %8s %8s %8s %8s %8s" % [row[0], row[1], row[3], row[5], row[7], row[9]]
end  
puts "\n"

# NOTE: All the printouts below were useful during the writing of this program, but
# aren't necessary for assessing the program now that it is fully functional.

# p vol_q_1_ary
# p vol_q_2_ary
# p vol_q_3_ary
# p vol_q_4_ary
# p vol_q_5_ary

# p ret_q_1_ary
# p ret_q_2_ary
# p ret_q_3_ary
# p ret_q_4_ary
# p ret_q_5_ary

# sim_ary.each { |sim|
#   puts "SIMULATION ##{sim.sim_num}:"
#   puts "vol_sim: #{sim.vol_sim}"
#   puts "ret_sim: #{sim.ret_sim}"
#   puts "-----------------------------------------------"   
# }

# puts "Printout of first sim_ary hash just to see what it looks like:"
# p sim_ary[0]
# puts "\n"

# puts "Printout of table name array to check that it contains what I need it to:"
# p table_ary
# puts "\n"

# p = sim_ary.length - 1
# puts "Printout of column names from simulation_table:"
# db = SQLite3::Database.open "Simulations.db"
# pst = db.prepare "SELECT * FROM simulation_table_#{p}"    
# puts "Column names:"
# puts pst.columns
# puts "\n"

# Printout of Sim_1 can only happen if counter 'k' in line 204
# is set to a value greater than zero
# puts "Printout of Sim_1 rows and column names:"
# db = SQLite3::Database.open "Simulations.db"
# rows = db.execute2 "SELECT * FROM Sim_1 LIMIT 5"
# rows.each do |row|
  # puts "%2s %4s" % [row[0], row[1]]
# end  
# puts "\n"

# Printout of Sim_2 can only happen if counter 'k' in line 204
# is set to a value greater than one
# puts "Print out of Sim_2 rows and column names:"
# db = SQLite3::Database.open "Simulations.db"
# rows = db.execute2 "SELECT * FROM Sim_2 LIMIT 5"
# rows.each do |row|
  # puts "%2s %4s %4s" % [row[0], row[1], row[2]]
# end  
# puts "\n"