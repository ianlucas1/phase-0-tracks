# OPERATION KITTEN EXPLOSION!

# talk about Object Relational Mapping (ORM)

# www.rubydoc.info/githug/luislavena/sqlite3-ruby

# require gems
# faker gem is useful for generating random 'users'
require 'sqlite3'
require 'faker' # need to look up all 'user' info types sometime

# create SQLite3 database
# documentation: http://www.rubydoc.info/github/luislavena/sqlite3-ruby/SQLite3/Database
# SQLite3::Database.new( "data.db" ) do |db|
#   db.execute( "select * from data" ) do |row|
#     p row
#   end
# end

# create a database object and set internal items as hashes
db = SQLite3::Database.new("kittens.db")
db.results_as_hash = true

# string that serves as a command to create a SQL table
# note the <<- string delimiter
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS kittens(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    age INT
  )
SQL

# create a kittens table (if it's not there already)
db.execute(create_table_cmd)

# test: add a kitten
# db.execute("INSERT INTO kittens (name, age) VALUES ('Tiger', 1)")
# db.execute("SELECT * FROM kittens")

# method to add many kittens
def create_kitten(db, name, age)
  db.execute("INSERT INTO kittens (name, age) VALUES (?, ?)", [name, age])
end

10000.times do
  create_kitten(db, Faker::Name.name, 0)
end

# explore ORM by retrieving data
kittens = db.execute("SELECT * FROM kittens")
kittens.each do |kitten|
 puts "#{kitten['name']} is #{kitten['age']}"
end
