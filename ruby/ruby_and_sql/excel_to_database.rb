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

Volatility_Quintile_Observations.each do |row|
 puts "#{row['q1_column']} | #{row['q2_column']} | #{row['q3_column']} | #{row['q4_column']} | #{row['q5_column']}"
end

volatility_return_ary = [
%w[ -6.5% -14.3%  -11.3%  -17.9%  -19.9%  ],
%w[ -6.5% -9.3% -10.3%  -9.6% -10.9%  ],
%w[ -6.0% -7.2% -8.1% -8.6% -9.6% ],
%w[ -4.8% -6.7% -7.7% -7.4% -9.5% ],
%w[ -4.4% -6.4% -7.2% -6.2% -9.2% ],
%w[ -4.1% -4.8% -7.0% -5.5% -8.4% ],
%w[ -4.1% -4.0% -6.8% -4.6% -7.4% ],
%w[ -3.7% -3.8% -6.8% -3.6% -6.6% ],
%w[ -3.5% -3.6% -6.0% -3.5% -5.7% ],
%w[ -3.4% -3.2% -5.1% -3.3% -5.2% ],
%w[ -3.0% -3.1% -4.9% -3.1% -4.8% ],
%w[ -2.3% -2.9% -4.8% -3.0% -3.9% ],
%w[ -2.3% -2.7% -4.8% -2.9% -3.6% ],
%w[ -2.2% -2.6% -4.4% -2.9% -3.4% ],
%w[ -2.1% -2.5% -4.2% -2.6% -3.1% ],
%w[ -1.8% -2.5% -4.2% -2.5% -2.7% ],
%w[ -1.7% -2.5% -4.0% -2.5% -2.2% ],
%w[ -1.6% -2.5% -3.9% -2.4% -2.0% ],
%w[ -1.4% -2.3% -3.4% -2.4% -2.0% ],
%w[ -1.3% -2.2% -2.7% -2.3% -1.6% ],
%w[ -1.2% -2.0% -2.4% -2.3% -1.3% ],
%w[ -1.0% -2.0% -2.3% -1.6% -0.9% ],
%w[ -1.0% -2.0% -2.2% -1.5% -0.8% ],
%w[ -0.9% -1.5% -2.0% -1.5% -0.6% ],
%w[ -0.8% -1.5% -1.7% -1.5% -0.6% ],
%w[ -0.8% -1.4% -1.7% -1.3% -0.5% ],
%w[ -0.8% -1.4% -1.7% -1.2% -0.5% ],
%w[ -0.6% -1.3% -1.6% -1.2% -0.4% ],
%w[ -0.5% -0.9% -1.6% -0.9% -0.3% ],
%w[ -0.3% -0.9% -1.5% -0.9% -0.3% ],
%w[ -0.2% -0.8% -1.4% -0.7% -0.2% ],
%w[ -0.2% -0.8% -1.2% -0.7% 0.2%  ],
%w[ 0.2%  -0.7% -1.0% -0.4% 0.2%  ],
%w[ 0.4%  -0.2% -0.8% -0.3% 0.5%  ],
%w[ 0.6%  -0.2% -0.6% -0.3% 0.6%  ],
%w[ 0.7%  -0.1% -0.5% -0.2% 0.7%  ],
%w[ 0.7%  -0.1% -0.5% 0.1%  0.7%  ],
%w[ 0.8%  0.1%  -0.4% 0.1%  0.9%  ],
%w[ 0.9%  0.2%  -0.2% 0.2%  1.2%  ],
%w[ 0.9%  0.5%  0.0%  0.2%  1.6%  ],
%w[ 1.0%  0.5%  0.0%  0.2%  1.6%  ],
%w[ 1.0%  0.6%  0.0%  0.3%  1.8%  ],
%w[ 1.1%  0.8%  0.0%  0.4%  1.8%  ],
%w[ 1.1%  0.9%  0.2%  0.4%  2.0%  ],
%w[ 1.3%  1.0%  0.3%  0.5%  2.0%  ],
%w[ 1.3%  1.0%  0.3%  0.7%  2.2%  ],
%w[ 1.4%  1.2%  0.4%  0.7%  2.3%  ],
%w[ 1.4%  1.2%  0.4%  0.7%  2.5%  ],
%w[ 1.4%  1.2%  0.4%  0.8%  2.6%  ],
%w[ 1.5%  1.3%  0.4%  0.8%  2.6%  ],
%w[ 1.5%  1.3%  1.1%  0.9%  2.7%  ],
%w[ 1.6%  1.3%  1.3%  1.0%  2.9%  ],
%w[ 1.6%  1.4%  1.4%  1.0%  3.0%  ],
%w[ 1.7%  1.6%  1.5%  1.0%  3.1%  ],
%w[ 1.9%  1.7%  1.5%  1.1%  3.1%  ],
%w[ 2.0%  1.9%  1.7%  1.4%  3.1%  ],
%w[ 2.0%  1.9%  1.7%  1.5%  3.2%  ],
%w[ 2.0%  2.0%  1.8%  1.7%  3.3%  ],
%w[ 2.1%  2.0%  1.8%  1.7%  3.3%  ],
%w[ 2.3%  2.0%  2.1%  1.8%  3.4%  ],
%w[ 2.4%  2.0%  2.2%  2.1%  3.6%  ],
%w[ 2.4%  2.1%  2.3%  2.2%  3.9%  ],
%w[ 2.4%  2.3%  2.4%  2.2%  3.9%  ],
%w[ 2.4%  2.4%  2.4%  2.2%  4.0%  ],
%w[ 2.5%  2.4%  2.8%  2.3%  4.0%  ],
%w[ 2.6%  2.4%  3.2%  2.5%  4.0%  ],
%w[ 2.6%  2.4%  3.4%  2.6%  4.0%  ],
%w[ 2.6%  2.5%  3.9%  2.7%  4.2%  ],
%w[ 2.6%  2.6%  4.0%  2.7%  4.4%  ],
%w[ 2.7%  2.7%  4.2%  2.7%  4.4%  ],
%w[ 3.0%  2.8%  4.3%  2.8%  4.5%  ],
%w[ 3.0%  3.1%  4.7%  2.8%  4.5%  ],
%w[ 3.1%  3.2%  4.8%  3.2%  4.6%  ],
%w[ 3.2%  3.6%  4.9%  3.4%  4.6%  ],
%w[ 3.2%  3.6%  5.1%  3.4%  4.7%  ],
%w[ 3.3%  3.6%  5.2%  3.5%  4.8%  ],
%w[ 3.3%  3.9%  5.2%  3.5%  5.0%  ],
%w[ 3.4%  4.0%  5.2%  3.6%  5.0%  ],
%w[ 3.5%  4.0%  5.4%  3.8%  5.1%  ],
%w[ 3.7%  4.2%  5.5%  3.9%  5.2%  ],
%w[ 3.7%  4.3%  5.7%  3.9%  5.2%  ],
%w[ 3.9%  4.4%  5.8%  3.9%  5.6%  ],
%w[ 4.0%  4.4%  6.0%  4.0%  5.6%  ],
%w[ 4.0%  4.5%  6.0%  4.2%  5.6%  ],
%w[ 4.0%  4.6%  6.2%  4.7%  6.1%  ],
%w[ 4.1%  4.6%  6.3%  4.7%  6.1%  ],
%w[ 4.4%  4.9%  6.4%  5.3%  6.2%  ],
%w[ 4.4%  5.5%  6.8%  5.4%  6.3%  ],
%w[ 4.4%  5.6%  7.1%  6.5%  6.5%  ],
%w[ 4.4%  6.3%  7.4%  6.7%  6.8%  ],
%w[ 4.4%  7.1%  7.6%  6.8%  7.2%  ],
%w[ 4.8%  7.6%  8.3%  7.1%  8.0%  ],
%w[ 5.4%  8.7%  8.3%  8.2%  8.1%  ],
%w[ 5.4%  9.3%  9.0%  8.3%  8.2%  ],
%w[ 5.5%  9.4%  9.8%  9.9%  8.4%  ],
%w[ 5.7%  10.7% 10.0% 13.2% 8.5%  ],
%w[ 6.1%  nil   10.1% nil   12.2% ],
%w[ 6.5%  nil   nil   nil   nil   ]
]

# string that serves as a command to create a SQL table
create_ret_table = <<-SQL
  CREATE TABLE IF NOT EXISTS ret_table(
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
db.execute(create_ret_table)

# method to add quintile column
def add_return_rows(db, q1_obs, q2_obs, q3_obs, q4_obs, q5_obs)
  db.execute("INSERT INTO ret_table (q1_column, q2_column, q3_column, q4_column, q5_column) VALUES (?, ?, ?, ?, ?)", [q1_obs, q2_obs, q3_obs, q4_obs, q5_obs])
end

volatility_return_ary.each do |q1_obs, q2_obs, q3_obs, q4_obs, q5_obs|
  add_return_rows(db, q1_obs, q2_obs, q3_obs, q4_obs, q5_obs)
end

Vol_Quintile_Ret_Observations = db.execute("SELECT * FROM ret_table")

# p Volatility_Quintile_Observations

Vol_Quintile_Ret_Observations.each do |row|
 puts "#{row['q1_column']} | #{row['q2_column']} | #{row['q3_column']} | #{row['q4_column']} | #{row['q5_column']}"
end