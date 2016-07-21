# require gems
require 'sqlite3'

volatility_quintile_ary = [
%w[ 1 1 1 1 1 ],
%w[ 1 1 2 2 2 ],
%w[ 1 1 2 3 3 ],
%w[ 1 1 2 3 3 ],
%w[ 1 1 2 3 4 ],
%w[ 1 1 2 3 4 ],
%w[ 1 1 2 3 4 ],
%w[ 1 1 2 3 4 ],
%w[ 1 1 2 3 4 ],
%w[ 1 1 2 3 4 ],
%w[ 1 1 2 3 4 ],
%w[ 1 2 2 3 4 ],
%w[ 1 2 2 3 4 ],
%w[ 1 2 2 3 4 ],
%w[ 1 2 2 3 4 ],
%w[ 1 2 2 4 4 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 2 3 4 5 ],
%w[ 1 3 4 4 5 ],
%w[ 2 3 4 4 5 ],
%w[ 2 3 4 5 5 ],
%w[ 2 3 4 5 5 ],
%w[ 2 3 4 5 5 ],
%w[ 2 3 4 5 5 ],
%w[ 2 3 4 5 5 ],
%w[ 2 3 4 5 5 ],
%w[ 2 3 4 5 5 ],
%w[ 2 3 4 5 5 ],
%w[ 2 3 4 5 5 ],
%w[ 3 3 5 5 5 ],
%w[ 4 4 5 5 5 ],
%w[ 5 5 5 5 5 ]
]

# p Volatility_Quintile_Probability_Ary

db = SQLite3::Database.new("Volatility_Quintile_Probabilities.db")
db.results_as_hash = true

# string that serves as a command to create a SQL table
create_vol_prob_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS q_table(
    obs INTEGER PRIMARY KEY,
    q1_column INT,
    q2_column INT,
    q3_column INT,
    q4_column INT,
    q5_column INT
  )
SQL

# create a table of volatility quintiles with following-period quintile 
# observation (if it's not there already)
db.execute(create_vol_prob_table_cmd)

# method to add quintile column
def add_quintile_rows(db, q1_obs, q2_obs, q3_obs, q4_obs, q5_obs)
  db.execute("INSERT INTO q_table (q1_column, q2_column, q3_column, q4_column, q5_column) VALUES (?, ?, ?, ?, ?)", [q1_obs, q2_obs, q3_obs, q4_obs, q5_obs])
end

volatility_quintile_ary.each do |q1_obs, q2_obs, q3_obs, q4_obs, q5_obs|
  add_quintile_rows(db, q1_obs, q2_obs, q3_obs, q4_obs, q5_obs)
end

Volatility_Quintile_Observations = db.execute("SELECT * FROM q_table")

# p Volatility_Quintile_Observations

# Volatility_Quintile_Observations.each do |row|
#  puts "#{row['q1_column']} | #{row['q2_column']} | #{row['q3_column']} | #{row['q4_column']} | #{row['q5_column']}"
# end

# q_1_ary = []
# q_2_ary = []
# q_3_ary = []
# q_4_ary = []
# q_5_ary = []

# Volatility_Quintile_Observations.each do |row|
#  q_1_ary  << row['q1_column']
#  q_2_ary  << row['q2_column']
#  q_3_ary  << row['q3_column']
#  q_4_ary  << row['q4_column']
#  q_5_ary  << row['q5_column']
# end

# p q_1_ary
# p q_2_ary
# p q_3_ary
# p q_4_ary
# p q_5_ary