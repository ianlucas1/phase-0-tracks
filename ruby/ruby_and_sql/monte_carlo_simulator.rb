# This program accesses financial data from pre-existing SQLite  
# database tables built in the excel_to_database.rb file - please
# run excel_to_database.rb first in the command line before running
# this file.

# The purpose of this program is to perform a Monte Carlo simulation 
# method employing "re-sampling with replacement" where the sampling  
# is based on probabilities of ex ante financial return distributions 
# that are governed by prior period return volatility

# The output of this program is a new data table that contains the 
# results of all the simulations performed.

# I believe it is better to have a long simulation in a single column
# from which non-overlapping samples can be studied, but to show the
# work that I put into figuring out how to run SQL commands with Ruby
# the final simulation table puts distinct simulations side-by-side
# in multiple columns.

# The way I ultimately got this to work was by creating a series of 
# new aggregate tables by using CREATE TABLE and JOIN commands together;
# I believe there are more efficient ways of achieving the same effect,
# but I put more time than I would like to admit into this solution, so
# this is the one I'm going with for the time being.

# require gems
require 'sqlite3'

# access database of volatility and return quintile tables
# NOTE: Simulations.db is the output of excel_to_database.rb
db = SQLite3::Database.open "Simulations.db"
db.results_as_hash = true

# create variables to access each item in the database tables
volatility_table = db.execute("SELECT * FROM volatility_table")
return_table = db.execute("SELECT * FROM return_table")

# create arrays to store the column data from the database
# (these arrays will be sampled later in the program)
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

# fill the arrays with the table's column data
volatility_table.each do |row|
  vol_q_1_ary << row['quintile_1']
  vol_q_2_ary << row['quintile_2']
  vol_q_3_ary << row['quintile_3']
  vol_q_4_ary << row['quintile_4']
  vol_q_5_ary << row['quintile_5']
end

# the return table contains some nil values,
# so those are removed in this process
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

# a. define simulation class with requisite attributes to run the simulations
#    sim_num is my version of a data table primary key for keeping track of
#    simulations added to the sim_ary.
# b. vol_sim is an array into which the simulated volatility values are added.
# c. ret_sim is an array into which the simulated return values are added.
# d. vol_sim is seeded with an initially randomized quintile value from 1 to 5.
# e. subsequent vol_sim values probabilistically depend upon the immediately 
#    prior value; vol_sim values dictate which return distribution quintile  
#    that ret_sim values are drawn from
class Simulation

  attr_reader :sim_num
  attr_accessor :vol_sim, :ret_sim 

  def initialize(sim_num)
    @sim_num = sim_num
    @vol_sim = [rand(1..5)]
    @ret_sim = [nil]
  end

end

# Create an array to store each simulation.
sim_ary = []

# Create array to store table names.
# This is used for iteratively adding simulation columns
# to an aggregated data table after all the simulations
# are run.
table_ary = []

a = 1

# Initiate any number of simulations and assign the simulation number.
1.upto(10) do |sim|
  sim_ary << Simulation.new("#{sim}")
end

# Next, we iteratively build each simulation's volatility and return array.
sim_ary.each do |sim|

# The if-else logic randomly draws from the volatility quintile 
# arrays and the return quintile arrays that were populated with data 
# imported from the volatility_table as well as the return_table
# contained in the Simulation database.

# Beginning with a randomly assigned number 1 - 5 (corresponding to
# the five quintile columns in those tables), the program samples
# the volatility array, which itself contains quintile values based
# on the previously assessed probability that an observation from
# a given quintile value will occur in the subsequent period.

  b = 0

  # The number that the 'i' counter goes up to represents months 
  # that determine the length of the simulation.
  until b == 10
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
  # the values sampled from the series of return arrays.
  create_vol_prob_table = 
    "CREATE TABLE IF NOT EXISTS Sim_#{a}(
    obs INTEGER PRIMARY KEY,
    sim_#{a} INT
    );"

  # Run SQLite command to create create the simulation table.  
  db.execute(create_vol_prob_table)

  # Add Sim_x's to the table_ary where Sim_x corresponds to the names
  # of the individual data tables that store each simulation's output
  table_ary << "Sim_#{a}"
    
  # method to insert each sampled return observation into the simulation table
  def add_sim(db, obs, a)
    db.execute("INSERT INTO Sim_#{a} (sim_#{a}) VALUES (?)", [obs])
  end

  # create an object that holds all the simulation values that will be inserted
  # into the individual simulation table
  ret_quintile_ary = sim.ret_sim

  # execute the insertion of each simulation value, thus completing one simulation
  # before looping to the next simulation
  ret_quintile_ary.each do |obs|
    add_sim(db, obs, a)
  end

  a += 1

end

# Create an simulation data table that combines the results of
# the first two simulations
# I found that I had to do this step before I could iteratively
# construct a data table that aggregates all of the simulations,
# which is accomplished in the loop that follows this step
j = 0
db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS simulation_table_#{sim_ary[j].sim_num}
    AS SELECT *
    FROM #{table_ary[0]}
    JOIN #{table_ary[1]}
    ON #{table_ary[0]}.obs = #{table_ary[1]}.obs;
  SQL

# Next, I iteratively build simulation tables that aggregate all of the simulations.
# Note: in subsequent steps, I drop all the data tables that serve as 
#       temporary files that would otherwise clutter the database.
# Note: There are redundant obs columns in the simulation tables; there is no
#       SQLite command to drop columns that I could find.
# Note: When I print out a sample of columns from the ultimate simulation table,
#       I omit the redundant columns for convenience.
k = 2
l = 0
until k == table_ary.length

  db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS simulation_table_#{k}
    AS SELECT *
    FROM simulation_table_#{sim_ary[l].sim_num}
    JOIN #{table_ary[k]}
    ON simulation_table_#{sim_ary[l].sim_num}.obs = #{table_ary[k]}.obs;
  SQL

  k += 1
  l += 1
end

m = 0
until m == sim_ary.length
  db.execute <<-SQL
      DROP TABLE #{table_ary[m]};
  SQL
  m += 1
end

n = sim_ary.length - 2
until n == 0
  db.execute <<-SQL
      DROP TABLE simulation_table_#{n};
  SQL
  n -= 1
end

# ==========================================================

# PRINTOUTS

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

o = sim_ary.length - 1
puts "THE FIRST 5 SIMULATIONS IN THE SIMULATION TABLE:"
db = SQLite3::Database.open "Simulations.db"
rows = db.execute2 "SELECT * FROM simulation_table_#{o}"
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