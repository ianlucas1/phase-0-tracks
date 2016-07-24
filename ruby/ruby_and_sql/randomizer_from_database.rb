# require gems
require 'sqlite3'

# access database of volatility and return quintile tables
db = SQLite3::Database.open "Simulations.db"
db.results_as_hash = true

# create variable to access each item in the database tables
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

# define simulation class with requisite attributes to run the simulations
class Simulation

  attr_reader :sim_num
  attr_accessor :vol_sim, :ret_sim 

  def initialize(sim_num)
    @sim_num = sim_num
    @vol_sim = [rand(1..5)]
    @ret_sim = [nil]
  end

end

# create an array to store each sim
sim_ary = []
table_ary = []
col_ary = []

# initiate any number of simulations
# each simulation is numbered, which is my version of a data table primary key
1.upto(2) do |sim|
  sim_ary << Simulation.new("#{sim}")
end

# Next, we iteratively build each simulation's volatility and return array
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

  i = 0

  # the number that 'i' goes up to represents months that determine
  # the length of the simulation
  until i == 10
    if sim.vol_sim[i] == 1
      sim.vol_sim << vol_q_1_ary.sample
      sim.ret_sim << ret_q_1_ary.sample
    elsif sim.vol_sim[i] == 2
      sim.vol_sim << vol_q_2_ary.sample
      sim.ret_sim << ret_q_2_ary.sample
    elsif sim.vol_sim[i] == 3
      sim.vol_sim << vol_q_3_ary.sample
      sim.ret_sim << ret_q_3_ary.sample
    elsif sim.vol_sim[i] == 4
      sim.vol_sim << vol_q_4_ary.sample
      sim.ret_sim << ret_q_4_ary.sample
    else
      sim.vol_sim << vol_q_5_ary.sample
      sim.ret_sim << ret_q_5_ary.sample
    end
    i += 1  
  end

  # string commands to create a table for each simulation to store 
  # the values sampled from the series of return arrays
  create_vol_prob_table = 
    "CREATE TABLE IF NOT EXISTS Sim_#{sim.sim_num}(
    obs INTEGER PRIMARY KEY,
    sim_#{sim.sim_num} INT
    );"

  # create the simulation table  
  db.execute(create_vol_prob_table)

  table_ary << "Sim_#{sim.sim_num}"
    
  col_names = db.prepare "SELECT * FROM Sim_#{sim.sim_num} WHERE sim_#{sim.sim_num}"
  col_ary << col_names.columns.last

  # method to insert each sampled return observation into the simulation table
  def add_sim(db, obs, i)
    db.execute("INSERT INTO Sim_#{i} (sim_#{i}) VALUES (?)", [obs])
  end

  # create an object that holds all the simulation values that will be inserted
  # into the simulation table
  ret_quintile_ary = sim.ret_sim

  # execute the insertion of each simulation value, thus completing the simulation
  ret_quintile_ary.each do |obs|
    add_sim(db, obs, sim.sim_num)
  end

end

  db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS joint_table
    AS SELECT *
    FROM Sim_1
    JOIN Sim_2
    ON Sim_1.obs = Sim_2.obs;
  SQL

https://www.sqlite.org/faq.html#q11

# # iteratively join all the simulation tables into a single table
# i = 0
# j = 1

# until i = col_ary.length

#   db.execute <<-SQL
#     CREATE TABLE IF NOT EXISTS joint_table
#     AS SELECT Sim_1.obs, Sim_1.sim_1, Sim_2.sim_2
#     FROM Sim_1
#     JOIN Sim_2
#     ON Sim_1.obs = Sim_2.obs;
#   SQL

# Printout of column array:
# ["Sim_1", "Sim_2"]

# Printout of column array:
# ["sim_1", "sim_2"]

#   db.execute <<-SQL
#     CREATE TABLE IF NOT EXISTS joint_table
#     AS SELECT Sim_1.obs, Sim_1.sim_1, Sim_2.sim_2
#     FROM Sim_1
#     JOIN Sim_2
#     ON Sim_1.obs = {table_ary.[j];
#   SQL

# end


# PRINTOUTS
begin

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

# puts "Printout of first sim_ary hash:"
# p sim_ary[0]
# puts "\n"

puts "Printout of table name array:"
p table_ary
puts "\n"

puts "Printout of column name array:"
p col_ary
puts "\n"

puts "Printout of all tables in the database:"

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

# puts "Using PRAGMA table_info(tableName) to get metadata about table Sim_1:"  
db = SQLite3::Database.open "Simulations.db" 
stm = db.prepare "PRAGMA table_info('Sim_1')" 
rs = stm.execute 
rs.each do |row|
  # puts row.join "\s"
end
# puts "\n"

# puts "Printout of Sim_1 rows and column names:"
db = SQLite3::Database.open "Simulations.db"
rows = db.execute2 "SELECT * FROM Sim_1 LIMIT 5"
rows.each do |row|
  # puts "%2s %4s" % [row[0], row[1]]
end  
# puts "\n"

# puts "Print out of Sim_2 rows and column names:"
db = SQLite3::Database.open "Simulations.db"
rows = db.execute2 "SELECT * FROM Sim_2 LIMIT 5"
rows.each do |row|
  # puts "%2s %4s %4s" % [row[0], row[1], row[2]]
end  
# puts "\n"

puts "Print out of joint_table rows and column names:"
db = SQLite3::Database.open "Simulations.db"
rows = db.execute2 "SELECT * FROM joint_table"
rows.each do |row|
  puts "%2s %9s %9s %9s" % [row[0], row[1], row[2], row[3]]
end  
puts "\n"

end