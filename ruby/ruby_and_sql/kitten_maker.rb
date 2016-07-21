# require gems
require 'sqlite3'
require 'faker' # need to look up all 'user' info types sometime

db = SQLite3::Database.new("kittens.db")
db.results_as_hash = true

create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS kitten_table(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    age INT
  )
SQL


# create a kittens table (if it's not there already)
db.execute(create_table_cmd)

# test: add a kitten
db.execute("INSERT INTO kitten_table (name, age) VALUES ('Tiger', 1)")
db.execute("SELECT * FROM kitten_table")

# method to add many kittens
# def create_kitten(db, name, age)
#   db.execute("INSERT INTO kitten_table (name, age) VALUES (?, ?)", [name, age])
# end

# 10000.times do
#   create_kitten(db, Faker::Name.name, 0)
# end

# # # explore ORM by retrieving data
# kittens = db.execute("SELECT * FROM kitten_table")
# kittens.each do |kitten|
#  puts "#{kitten['name']} is #{kitten['age']}"
# end








