require 'sqlite3'

db = SQLite3::Database.new("test.db")
db.results_as_hash = true

class Simulation
  attr_reader :simulation_number, :starting_quintile
  attr_accessor :vol_sims, :ret_sims 
  def initialize(simulation_number)
    @simulation_number = simulation_number
    @starting_quintile = rand(1..5)
    @vol_sims = %w[ 1 2 3 4 5 ]
    @ret_sims = %w[ 1% 2% 3% 4% 5% ]
  end
end

simulations = []

1.upto(2) { |simulation|
  simulations << Simulation.new("#{simulation}")
}

simulations.each do |simulation|
  p simulation.vol_sims
end

p simulations


# volatility_quintile_ary = %w[ 1 2 3 4 5 ]

simulations.each do |simulation|
  
  create_vol_prob_table = <<-SQL
  CREATE TABLE IF NOT EXISTS Sim_#{simulation.simulation_number}(
    obs INTEGER PRIMARY KEY,
    q1_column INT
    )
  SQL

  db.execute(create_vol_prob_table)

  def add_quintile_rows(db, q1_obs, i)
    db.execute("INSERT INTO Sim_#{i} (q1_column) VALUES (?)", [q1_obs])
  end

  volatility_quintile_ary = simulation.vol_sims

  volatility_quintile_ary.each do |q1_obs|
    add_quintile_rows(db, q1_obs, simulation.simulation_number)
  end

  volatility_quintile_observations = db.execute("SELECT * FROM Sim_#{simulation.simulation_number}")

  volatility_quintile_observations.each do |row|
   puts "#{row['q1_column']}"
  end

end

# create_vol_prob_table = <<-SQL
#   CREATE TABLE IF NOT EXISTS q_table(
#     obs INTEGER PRIMARY KEY,
#     q1_column INT
#   )
# SQL

# # create a table that will store the five columns 
# db.execute(create_vol_prob_table)

# # method to insert the rows of five columns
# def add_quintile_rows(db, q1_obs)
#   db.execute("INSERT INTO q_table (q1_column) VALUES (?)", [q1_obs])
# end

# # loop to iteratively insert each row in the nested array
# volatility_quintile_ary.each do |q1_obs|
#   add_quintile_rows(db, q1_obs)
# end

# # variable to execute SQL query of the data points in each cell of each row
# Volatility_Quintile_Observations = db.execute("SELECT * FROM q_table")

# # test print
# # p Volatility_Quintile_Observations

# # loop to print out the data points in each row of the table
# Volatility_Quintile_Observations.each do |row|
#  puts "#{row['q1_column']}"
# end



# i=1
# until i == 6
#   create_test_table = <<-SQL
#     CREATE TABLE IF NOT EXISTS #{[i]}(
#       id INTEGER PRIMARY KEY,
#       sim INT
#     )
#   SQL
#   db.execute(create_test_table)
#   i += 1
# end

# # def insert_sim(db, data_point)
# #   db.execute("INSERT INTO #{[i]} (data_point) VALUES (?)", [data_point])
# # end

# i=1
# j=[]
# until i == 6

#   [j] << [1, 2, 3, 4, 5]

#   [j].each do |j|
#     db.execute("INSERT INTO #{[i]} (sim) VALUES (?)", [[j]])
#   end

#   i += 1
# end


# test print of the array data
# p vq_1_ary
# p vq_2_ary
# p vq_3_ary
# p vq_4_ary
# p vq_5_ary

# i=0
# until i == 6
#   db.execute("INSERT INTO #{[i]} (sim) VALUES (?)", [rand(1..5)])
#   i += 1
# end






# i=0
# until i == 2
#   create_test_table = <<-SQL
#     CREATE TABLE #{[i]}(
#       id INTEGER PRIMARY KEY,
#       sim INT
#     )
#   SQL
#   db.execute(create_test_table)
#   3.times do
#     db.execute("INSERT INTO #{[i]} (sim) VALUES (?)", [rand(1..5)])
#   end
#   i += 1
# end

# i=0
# until i == 2
#   columns = db.execute("SELECT * FROM #{[i]}")
#   columns.each do |column|
#    puts "#{column['id']} is #{column['sim']}"
#   end
#   puts "---"
#   i += 1
# end

# joined_tables = db.execute("SELECT [0].id, [0].sim, [1].sim FROM [0] JOIN [1] ON [0].id = [1].id;")
# p joined_tables
# p joined_tables.class
# p joined_tables.length


# ====================================================
# create_test_table = <<-SQL
#   CREATE TABLE test_table(
#     id INTEGER PRIMARY KEY,
#     sim INT
#   )
# SQL

# alter_test_table = <<-SQL
#   ALTER TABLE test_table
#     ADD new_column INT
# SQL
# db.execute(alter_test_table)

# class Test_Simulation
#   attr_reader :simulation_number, :starting_quintile
#   attr_accessor :vol_sims, :ret_sims 
#   def initialize(simulation_number, starting_quintile)
#     @simulation_number = simulation_number
#     @starting_quintile = starting_quintile
#     @vol_sims = [starting_quintile]
#     @ret_sims = [nil]
#   end
# end

# test_sims = []

# def new_sim(db, rand_num)
#   db.execute("INSERT INTO test_table (column) VALUES (?)", [rand_num])
# end

# # generates random quintiles for a single simulation
# 5.times do
#   new_sim(db, rand(1..5))
# end

# 10.times do
#   db.execute("INSERT INTO test_table (column) VALUES (?)", [rand(1..5)])
# end

# i = 2
# until i == 10
#   add_column = "ALTER TABLE test_table ADD #{[i]}"
#   db.execute(add_column)
#   sim = rand(1..5)
#   add_sim = "INSERT INTO test_table #{[i]} VALUES #{[sim]}"
#   db.execute(add_sim)
#   i += 1
# end

# def create_kitten(db, name, age)
#   db.execute("INSERT INTO kitten_table (name, age) VALUES (?, ?)", [name, age])
# end

# 10.times do
#   create_kitten(db, Faker::Name.name, 0)
# end
# ====================================================


# POTENTIALLY USEFUL CODE
# db = SQLite3::Database.new("test.db")

# create_user_table = <<-SQL
#     CREATE TABLE IF NOT EXISTS user(
#       id INTEGER PRIMARY KEY,
#       name VARCHAR(255)
#     )
#   SQL
# db.execute(create_user_table)

# create_email_table = <<-SQL
#     CREATE TABLE IF NOT EXISTS email(
#       id INTEGER PRIMARY KEY,
#       email VARCHAR(255)
#     )
#   SQL
# db.execute(create_email_table)

# # --==[ before ]==--
# db.execute("insert into user (id, name) values (1, 'Joe')")
# db.execute("insert into email (id, email) values (1, 'joe@gmail.com')")

# user_ary = db.execute("SELECT user.id, user.name, email.email FROM user, email WHERE user.id = email.id")
# user_ary_split = user_ary[0].join(", ").split
# p user_ary_split



# UNEVALUATED CODE
# # --==[ do the merge ]==--
# CREATE TABLE user_with_email SELECT user.id, user.name, user.email FROM user, email WHERE user.id = email.id
# db.execute("CREATE TABLE user_with_email SELECT user.id, user.name, email.email FROM user, email WHERE user.id = email.id")
# drop table user;
# drop table email;
# # --==[ after ]==--
# insert into user_with_email id, name, email values (2, "Bruce", "Bruce - at - springsteen.com");
# select id, name, email from user_with_email;






