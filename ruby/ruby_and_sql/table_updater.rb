require 'sqlite3'

db = SQLite3::Database.new("test.db")
db.results_as_hash = true

class Simulation
  attr_reader :sim_num, :starting_quintile
  attr_accessor :vol_sim, :ret_sim 
  def initialize(sim_num)
    @sim_num = sim_num
    @starting_quintile = rand(1..5)
    @vol_sim = %w[ 1 2 3 4 5 ]
    @ret_sim = %w[ 1% 2% 3% 4% 5% ]
  end
end

sim_ary = []

1.upto(2) { |sim|
  sim_ary << Simulation.new("#{sim}")
}

sim_ary.each do |sim|
  
  create_vol_prob_table = <<-SQL
    CREATE TABLE IF NOT EXISTS Sim_#{sim.sim_num}(
    obs INTEGER PRIMARY KEY,
    sim_#{sim.sim_num} INT
    )
  SQL

  db.execute(create_vol_prob_table)

  def add_sim(db, obs, i)
    db.execute("INSERT INTO Sim_#{i} (sim_#{i}) VALUES (?)", [obs])
  end

  volatility_quintile_ary = sim.ret_sim

  volatility_quintile_ary.each do |obs|
    add_sim(db, obs, sim.sim_num)
  end

end

db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS joint_table
  AS SELECT Sim_1.obs, Sim_1.sim_1, Sim_2.sim_2
  FROM Sim_1
  JOIN Sim_2
  ON Sim_1.obs = Sim_2.obs;
SQL

# PRINTOUTS

puts "Printout of first sim_ary hash:"
p sim_ary[0]
puts "\n"

puts "Printout of all tables in the database:"
begin
  db = SQLite3::Database.open "test.db"
  rows = db.execute <<-SQL
    SELECT name FROM sqlite_master
    WHERE type = 'table'
    ORDER BY name;
  SQL
  rows.each do |row|
    puts row
  end
  puts "\n"

#puts "Using PRAGMA table_info(tableName) to get metadata about table Sim_1:"  
  db = SQLite3::Database.open "test.db" 
  stm = db.prepare "PRAGMA table_info('Sim_1')" 
  rs = stm.execute 
  rs.each do |row|
 #   puts row.join "\s"
  end
  #puts "\n"

# puts "Printout of Sim_1 rows and column names:"
  db = SQLite3::Database.open "test.db"
  rows = db.execute2 "SELECT * FROM Sim_1 LIMIT 5"
  rows.each do |row|
    # puts "%2s %4s" % [row[0], row[1]]
  end  
  # puts "\n"

# puts "Print out of Sim_2 rows and column names:"
  db = SQLite3::Database.open "test.db"
  rows = db.execute2 "SELECT * FROM Sim_2 LIMIT 5"
  rows.each do |row|
    # puts "%2s %4s %4s" % [row[0], row[1], row[2]]
  end  
  # puts "\n"

puts "Print out of joint_table rows and column names:"
  db = SQLite3::Database.open "test.db"
  rows = db.execute2 "SELECT * FROM joint_table LIMIT 5"
  rows.each do |row|
    puts "%2s %4s %5s" % [row[0], row[1], row[2]]
  end  
  puts "\n"

end






















 # SELECT * INTO Persons_backup FROM Persons

  # merged_sim = db.execute("CREATE TABLE joint_table AS SELECT Sim_1.obs, Sim_1.sim_1, Sim_2.sim_2 FROM Sim_1, Sim_2 WHERE Sim_1.obs = Sim_2.obs;")

# p ret_sim_ary

# ret_sim_ary.each do |sim|

#   def add_sim(db, obs, i)
#     db.execute("INSERT INTO Sim_#{i} (sim_#{i}) VALUES (?)", [obs])
#   end

#   add_sim(db, obs, sim.sim_num)
  

# joined_sim = <<-SQL
#   CREATE VIEW
#   db.joined_sim
#   AS
#   SELECT
#     Sim_1.id, 
#     Sim_1.sim_1,
#     Sim_2.sim_2
#   FROM
#     Sim_1
#   LEFT JOIN
#     Sim_2
# SQL

# joined_sim_view = db.execute(joined_sim)

# puts joined_sim
# puts joined_sim_view


# volatility_quintile_ary = %w[ 1 2 3 4 5 ]

# create_vol_prob_table = <<-SQL
#   CREATE TABLE IF NOT EXISTS q_table(
#     obs INTEGER PRIMARY KEY,
#     q1_column INT
#   )
# SQL

# # create a table that will store the five columns 
# db.execute(create_vol_prob_table)

# # method to insert the rows of five columns
# def add_quintile_rows(db, obs)
#   db.execute("INSERT INTO q_table (q1_column) VALUES (?)", [obs])
# end

# # loop to iteratively insert each row in the nested array
# volatility_quintile_ary.each do |obs|
#   add_quintile_rows(db, obs)
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
#   attr_reader :sim_num, :starting_quintile
#   attr_accessor :vol_sim, :ret_sim 
#   def initialize(sim_num, starting_quintile)
#     @sim_num = sim_num
#     @starting_quintile = starting_quintile
#     @vol_sim = [starting_quintile]
#     @ret_sim = [nil]
#   end
# end

# test_sim = []

# def new_sim(db, rand_num)
#   db.execute("INSERT INTO test_table (column) VALUES (?)", [rand_num])
# end

# # generates random quintiles for a single sim
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

# ALMOST BUT NOT QUITE PROPER MERGE


# sim_ary.each do |sim|
# end

  # def add_quintile_rows(db, obs, i)
  #   db.execute("INSERT INTO sim_table (Sim_#{i}) VALUES (?)", [obs])
  # end

  # volatility_quintile_ary = sim.vol_sim

  # volatility_quintile_ary.each do |obs|
  #   add_quintile_rows(db, obs, sim.sim_num)
  # end

# LEGACY VERSION OF NEARLY FUNCTIONING CODE

# 1.upto(2) { |sim|
#   sim_ary << Simulation.new("#{sim}")
# }

# sim_ary.each do |sim|
#   p sim.ret_sim
# end

# create_blank_table = <<-SQL
#   CREATE TABLE IF NOT EXISTS sim_table(
#     obs INTEGER PRIMARY KEY,
#     sim_0 INT
#   )
# SQL

# db.execute(create_blank_table)

# sim_ary.each do |sim|
  
#   # db.execute("ALTER TABLE sim_table ADD sim_#{sim.sim_num} INT")

#   # ret_sim_ary << sim.ret_sim

#   create_vol_prob_table = <<-SQL
#   CREATE TABLE IF NOT EXISTS Sim_#{sim.sim_num}(
#     obs INTEGER PRIMARY KEY,
#     sim_#{sim.sim_num} INT
#     )
#   SQL

#   db.execute(create_vol_prob_table)

#   def add_sim(db, obs, i)
#     db.execute("INSERT INTO Sim_#{i} (sim_#{i}) VALUES (?)", [obs])
#   end

#   # def add_sim2(db, obs, i)
#   #   db.execute("INSERT INTO sim_table (sim_#{i}) VALUES (?) WHERE sim_table.obs = #{i}", [obs])
#   # end

#   volatility_quintile_ary = sim.ret_sim

#   volatility_quintile_ary.each do |obs|
#     add_sim(db, obs, sim.sim_num)
#     # add_sim2(db, obs, sim.sim_num)
#   end

#   volatility_quintile_obss = db.execute("SELECT * FROM Sim_#{sim.sim_num}")

#   # volatility_quintile_obss.each do |row, i|
#   #  puts "#{row['sim_#{sim.sim_num}']}"
#   # end

#   # db.execute("CREATE TABLE combo_table#{sim.sim_num} AS SELECT sim_table.obs, Sim_#{sim.sim_num}.sim_#{sim.sim_num} FROM sim_table, Sim_#{sim.sim_num} WHERE sim_table.obs = Sim_#{sim.sim_num}.obs;")

#   db.execute("CREATE TABLE sim_table#{sim.sim_num} AS SELECT Sim_1.obs, Sim_#{sim.sim_num}.obs, Sim_#{sim.sim_num}.sim_2 FROM sim_table JOIN Sim_#{sim.sim_num} ON Sim_1.obs = Sim_#{sim.sim_num}.obs;")

#   # CREATE TABLE joint_table12 AS SELECT Sim_1.obs, Sim_1.sim_1, Sim_2.sim_2 FROM Sim_1 JOIN Sim_2 ON Sim_1.obs = Sim_2.obs;

# end
