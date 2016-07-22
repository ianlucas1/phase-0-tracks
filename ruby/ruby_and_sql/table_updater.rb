require 'sqlite3'

test_quintile_ary = [
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ]
]

db = SQLite3::Database.new("test.db")
db.results_as_hash = true

create_test_table = <<-SQL
  CREATE TABLE test_table(
    id INTEGER PRIMARY KEY,
    column INT
  )
SQL

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

i=0
until i == 10
  create_test_table = <<-SQL
    CREATE TABLE #{[i]}(
      id INTEGER PRIMARY KEY,
      column INT
    )
  SQL
  db.execute(create_test_table)
  db.execute("INSERT INTO #{[i]} (column) VALUES (?)", [rand(1..5)])
  i += 1
end

i=0
until i == 10
  columns = db.execute("SELECT * FROM #{[i]}")
  columns.each do |column|
   puts "#{column['id']} is #{column['column']}"
  end
  i += 1
end



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











# p test_sims