# require gems
require 'sqlite3'
# require_relative 'excel_to_database'

db = SQLite3::Database.new("Volatility_Quintile_Probabilities.db")
db.results_as_hash = true

Volatility_Quintile_Observations = db.execute("SELECT * FROM q_table")

q_1_ary = []
q_2_ary = []
q_3_ary = []
q_4_ary = []
q_5_ary = []

Volatility_Quintile_Observations.each do |row|
 q_1_ary  << row['q1_column']
 q_2_ary  << row['q2_column']
 q_3_ary  << row['q3_column']
 q_4_ary  << row['q4_column']
 q_5_ary  << row['q5_column']
end

p q_1_ary
p q_2_ary
p q_3_ary
p q_4_ary
p q_5_ary