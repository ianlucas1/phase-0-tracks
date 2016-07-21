# require gems
require 'sqlite3'

db = SQLite3::Database.new("Volatility_Quintile_Probabilities.db")
db.results_as_hash = true

# string that serves as a command to create a SQL table
create_vol_prob_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS quintile_1(
    id INTEGER PRIMARY KEY,
    q1 INT,
  )
SQL

# create a table of volatility quintiles with following-period quintile 
# observation probabilities (if it's not there already)
db.execute(create_vol_prob_table_cmd)

Volatility_Quintile_Probability_Ary = %w[
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
2
2
2
2
2
2
2
2
2
2
3
4
5].map( &:to_i )

# # method to add quintile column
# def add_quintile(db, quintile_observation)
#   db.execute("INSERT INTO Volatility_Quintile_Probabilities (quintile) VALUES (?)", [quintile_observation])
# end

# Volatility_Quintile_Probability_Ary.each do |quintile_observation|
#   add_quintile(db, quintile_observation)
# end

# Volatility_Quintile_Probabilities = db.execute("SELECT * FROM Quintile_1")

# p Volatility_Quintile_Probability_Ary