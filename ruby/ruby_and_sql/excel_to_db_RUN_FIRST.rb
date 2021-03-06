# TABLE OF CONTENTS
# 1) INTRODUCTION
# 2) USER INTERFACE
# 3) BUSINESS LOGIC
# 4) PRINTOUTS

# ============================================================================
# ============================================================================
# ============================= INTRODUCTION =================================
# ============================================================================
# ============================================================================

# WARNING: This isn't a fun and fanciful program, like the Shakespearean Insult
# Generator, the Roller Derby Name Generator, or the Chuck Norris Fact Generator
# that I thought of building.  Instead, the two files I created for Challenge 8.5 
# relate to a financial engineering project that I have been working on in Excel.  
# My goal in this challenge was to replicate a portion of that project using SQL 
# and Ruby.  After no small amount of blood, sweat, and personal anguish, I 
# believe that I accomplished my goal.

# This program in this file converts large arrays of financial data into SQL
# database tables; the data in the arrays was pasted as a block from pre-formatted 
# Excel spreadsheets.  I know this exercise is slightly silly because most database
# programs can import spreadsheets into database files.  To my  knowledge, SQLite 
# does support importing CSV files (https://www.sqlite.org/cli.html#section_8), but
# I did to improve my understanding of how to interact with SQL via Ruby.

# The resulting database is then used by the other Ruby file in the directory, named
# monte_carlo_RUN_SECOND - so please read through and run this file to understand how the 
# database is constructed and then read/run the monte_carlo file to perform the 
# simulations which access and modify the database.



# ============================================================================
# ============================================================================
# ============================ USER INTERFACE ================================
# ============================================================================
# ============================================================================

# There is no user interface for this file.  Please just run it from the command 
# line, then open the accompanying file, monte_carlo_RUN_SECOND.rb, which does
# have a (very basic) user interface.



# ============================================================================
# ============================================================================
# ============================= BUSINESS LOGIC ===============================
# ============================================================================
# ============================================================================

# require gems
require 'sqlite3'

# create new database and a database object whose internal elements are hashes
db = SQLite3::Database.new "Simulations.db"
db.results_as_hash = true

# two string commands to create tables to store the five  
# columns of volatility and return data, respectively
create_volatility_table = <<-SQL
  CREATE TABLE IF NOT EXISTS volatility_table(
    obs INTEGER PRIMARY KEY,
    quintile_1 INT,
    quintile_2 INT,
    quintile_3 INT,
    quintile_4 INT,
    quintile_5 INT
  )
SQL

create_return_table = "CREATE TABLE IF NOT EXISTS return_table(
  obs INTEGER PRIMARY KEY,
  quintile_1 REAL,
  quintile_2 REAL,
  quintile_3 REAL,
  quintile_4 REAL,
  quintile_5 REAL
  )"

# Run SQLite commands to create the 5-column volatility and return tables.
db.execute(create_volatility_table)
db.execute(create_return_table)

# methods to insert data into the volatility and return tables
def add_volatility_rows(db, q1, q2, q3, q4, q5)
  db.execute("INSERT INTO volatility_table 
    (quintile_1, quintile_2, quintile_3, quintile_4, quintile_5) 
    VALUES (?, ?, ?, ?, ?)", [q1, q2, q3, q4, q5])
end

def add_return_rows(db, q1, q2, q3, q4, q5)
  db.execute("INSERT INTO return_table 
    (quintile_1, quintile_2, quintile_3, quintile_4, quintile_5) 
    VALUES (?, ?, ?, ?, ?)", [q1, q2, q3, q4, q5])
end

volatility_ary = [
[ 1 , 1 , 1 , 1 , 1 ],
[ 1 , 1 , 2 , 2 , 2 ],
[ 1 , 1 , 2 , 3 , 3 ],
[ 1 , 1 , 2 , 3 , 3 ],
[ 1 , 1 , 2 , 3 , 4 ],
[ 1 , 1 , 2 , 3 , 4 ],
[ 1 , 1 , 2 , 3 , 4 ],
[ 1 , 1 , 2 , 3 , 4 ],
[ 1 , 1 , 2 , 3 , 4 ],
[ 1 , 1 , 2 , 3 , 4 ],
[ 1 , 1 , 2 , 3 , 4 ],
[ 1 , 2 , 2 , 3 , 4 ],
[ 1 , 2 , 2 , 3 , 4 ],
[ 1 , 2 , 2 , 3 , 4 ],
[ 1 , 2 , 2 , 3 , 4 ],
[ 1 , 2 , 2 , 4 , 4 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 2 , 3 , 4 , 5 ],
[ 1 , 3 , 4 , 4 , 5 ],
[ 2 , 3 , 4 , 4 , 5 ],
[ 2 , 3 , 4 , 5 , 5 ],
[ 2 , 3 , 4 , 5 , 5 ],
[ 2 , 3 , 4 , 5 , 5 ],
[ 2 , 3 , 4 , 5 , 5 ],
[ 2 , 3 , 4 , 5 , 5 ],
[ 2 , 3 , 4 , 5 , 5 ],
[ 2 , 3 , 4 , 5 , 5 ],
[ 2 , 3 , 4 , 5 , 5 ],
[ 2 , 3 , 4 , 5 , 5 ],
[ 3 , 3 , 5 , 5 , 5 ],
[ 4 , 4 , 5 , 5 , 5 ],
[ 5 , 5 , 5 , 5 , 5 ]
]
 
return_ary = [
[ -0.0647 , -0.1431 , -0.1128 , -0.1793 , -0.1992 ],
[ -0.0647 , -0.0934 , -0.1028 , -0.0957 , -0.1091 ],
[ -0.0597 , -0.0724 , -0.0811 , -0.0863 , -0.0963 ],
[ -0.0482 , -0.0671 , -0.0767 , -0.0737 , -0.0945 ],
[ -0.0443 , -0.0635 , -0.0718 , -0.0622 , -0.0918 ],
[ -0.0407 , -0.0480 , -0.0704 , -0.0549 , -0.0844 ],
[ -0.0407 , -0.0397 , -0.0684 , -0.0463 , -0.0736 ],
[ -0.0367 , -0.0378 , -0.0677 , -0.0356 , -0.0659 ],
[ -0.0349 , -0.0362 , -0.0595 , -0.0352 , -0.0570 ],
[ -0.0341 , -0.0324 , -0.0514 , -0.0332 , -0.0522 ],
[ -0.0304 , -0.0307 , -0.0492 , -0.0313 , -0.0480 ],
[ -0.0227 , -0.0287 , -0.0484 , -0.0304 , -0.0395 ],
[ -0.0226 , -0.0270 , -0.0483 , -0.0293 , -0.0357 ],
[ -0.0222 , -0.0257 , -0.0436 , -0.0288 , -0.0343 ],
[ -0.0214 , -0.0253 , -0.0422 , -0.0259 , -0.0311 ],
[ -0.0181 , -0.0253 , -0.0418 , -0.0250 , -0.0266 ],
[ -0.0166 , -0.0248 , -0.0402 , -0.0245 , -0.0223 ],
[ -0.0161 , -0.0246 , -0.0388 , -0.0239 , -0.0203 ],
[ -0.0136 , -0.0233 , -0.0344 , -0.0235 , -0.0201 ],
[ -0.0127 , -0.0223 , -0.0272 , -0.0234 , -0.0157 ],
[ -0.0115 , -0.0204 , -0.0239 , -0.0226 , -0.0126 ],
[ -0.0104 , -0.0201 , -0.0229 , -0.0160 , -0.0093 ],
[ -0.0100 , -0.0198 , -0.0218 , -0.0152 , -0.0076 ],
[ -0.0091 , -0.0149 , -0.0204 , -0.0151 , -0.0065 ],
[ -0.0081 , -0.0146 , -0.0172 , -0.0151 , -0.0061 ],
[ -0.0080 , -0.0140 , -0.0171 , -0.0133 , -0.0054 ],
[ -0.0079 , -0.0138 , -0.0169 , -0.0125 , -0.0046 ],
[ -0.0057 , -0.0126 , -0.0158 , -0.0124 , -0.0043 ],
[ -0.0048 , -0.0094 , -0.0155 , -0.0088 , -0.0034 ],
[ -0.0030 , -0.0085 , -0.0153 , -0.0088 , -0.0033 ],
[ -0.0025 , -0.0084 , -0.0137 , -0.0069 , -0.0018 ],
[ -0.0022 , -0.0082 , -0.0119 , -0.0069 , 0.0015  ],
[ 0.0021  , -0.0066 , -0.0104 , -0.0043 , 0.0020  ],
[ 0.0042  , -0.0024 , -0.0083 , -0.0034 , 0.0047  ],
[ 0.0057  , -0.0016 , -0.0064 , -0.0031 , 0.0055  ],
[ 0.0071  , -0.0011 , -0.0052 , -0.0020 , 0.0066  ],
[ 0.0075  , -0.0007 , -0.0046 , 0.0007  , 0.0069  ],
[ 0.0082  , 0.0009  , -0.0044 , 0.0007  , 0.0087  ],
[ 0.0090  , 0.0024  , -0.0024 , 0.0018  , 0.0120  ],
[ 0.0094  , 0.0046  , -0.0002 , 0.0019  , 0.0157  ],
[ 0.0099  , 0.0051  , 0.0001  , 0.0023  , 0.0158  ],
[ 0.0103  , 0.0061  , 0.0004  , 0.0030  , 0.0178  ],
[ 0.0109  , 0.0076  , 0.0005  , 0.0037  , 0.0183  ],
[ 0.0113  , 0.0085  , 0.0020  , 0.0045  , 0.0200  ],
[ 0.0125  , 0.0099  , 0.0031  , 0.0051  , 0.0202  ],
[ 0.0133  , 0.0104  , 0.0032  , 0.0065  , 0.0218  ],
[ 0.0137  , 0.0117  , 0.0035  , 0.0067  , 0.0229  ],
[ 0.0138  , 0.0118  , 0.0036  , 0.0073  , 0.0253  ],
[ 0.0140  , 0.0125  , 0.0041  , 0.0079  , 0.0262  ],
[ 0.0152  , 0.0128  , 0.0045  , 0.0082  , 0.0264  ],
[ 0.0152  , 0.0129  , 0.0105  , 0.0086  , 0.0273  ],
[ 0.0156  , 0.0134  , 0.0129  , 0.0100  , 0.0285  ],
[ 0.0165  , 0.0142  , 0.0138  , 0.0101  , 0.0303  ],
[ 0.0172  , 0.0162  , 0.0148  , 0.0101  , 0.0305  ],
[ 0.0190  , 0.0171  , 0.0150  , 0.0110  , 0.0310  ],
[ 0.0195  , 0.0192  , 0.0171  , 0.0143  , 0.0311  ],
[ 0.0200  , 0.0193  , 0.0173  , 0.0147  , 0.0322  ],
[ 0.0202  , 0.0200  , 0.0178  , 0.0171  , 0.0328  ],
[ 0.0213  , 0.0201  , 0.0182  , 0.0172  , 0.0332  ],
[ 0.0226  , 0.0202  , 0.0205  , 0.0177  , 0.0339  ],
[ 0.0236  , 0.0204  , 0.0225  , 0.0211  , 0.0360  ],
[ 0.0238  , 0.0212  , 0.0231  , 0.0217  , 0.0385  ],
[ 0.0239  , 0.0229  , 0.0235  , 0.0219  , 0.0389  ],
[ 0.0241  , 0.0237  , 0.0241  , 0.0220  , 0.0401  ],
[ 0.0245  , 0.0239  , 0.0276  , 0.0235  , 0.0402  ],
[ 0.0255  , 0.0241  , 0.0321  , 0.0249  , 0.0403  ],
[ 0.0256  , 0.0244  , 0.0340  , 0.0258  , 0.0405  ],
[ 0.0256  , 0.0249  , 0.0393  , 0.0266  , 0.0422  ],
[ 0.0263  , 0.0257  , 0.0398  , 0.0267  , 0.0436  ],
[ 0.0266  , 0.0273  , 0.0420  , 0.0273  , 0.0438  ],
[ 0.0302  , 0.0282  , 0.0431  , 0.0276  , 0.0451  ],
[ 0.0304  , 0.0312  , 0.0471  , 0.0285  , 0.0452  ],
[ 0.0315  , 0.0317  , 0.0479  , 0.0322  , 0.0456  ],
[ 0.0323  , 0.0360  , 0.0493  , 0.0341  , 0.0457  ],
[ 0.0325  , 0.0361  , 0.0509  , 0.0343  , 0.0465  ],
[ 0.0327  , 0.0361  , 0.0518  , 0.0347  , 0.0483  ],
[ 0.0327  , 0.0390  , 0.0520  , 0.0348  , 0.0496  ],
[ 0.0343  , 0.0401  , 0.0523  , 0.0357  , 0.0501  ],
[ 0.0346  , 0.0403  , 0.0543  , 0.0380  , 0.0512  ],
[ 0.0373  , 0.0419  , 0.0550  , 0.0386  , 0.0519  ],
[ 0.0374  , 0.0428  , 0.0571  , 0.0388  , 0.0521  ],
[ 0.0393  , 0.0438  , 0.0577  , 0.0391  , 0.0562  ],
[ 0.0399  , 0.0441  , 0.0597  , 0.0399  , 0.0563  ],
[ 0.0402  , 0.0454  , 0.0598  , 0.0424  , 0.0564  ],
[ 0.0405  , 0.0464  , 0.0617  , 0.0465  , 0.0606  ],
[ 0.0406  , 0.0464  , 0.0631  , 0.0473  , 0.0607  ],
[ 0.0435  , 0.0491  , 0.0639  , 0.0535  , 0.0616  ],
[ 0.0438  , 0.0545  , 0.0679  , 0.0540  , 0.0626  ],
[ 0.0441  , 0.0565  , 0.0707  , 0.0648  , 0.0648  ],
[ 0.0443  , 0.0626  , 0.0736  , 0.0672  , 0.0680  ],
[ 0.0445  , 0.0712  , 0.0763  , 0.0683  , 0.0715  ],
[ 0.0482  , 0.0760  , 0.0828  , 0.0709  , 0.0796  ],
[ 0.0536  , 0.0868  , 0.0832  , 0.0816  , 0.0811  ],
[ 0.0537  , 0.0930  , 0.0897  , 0.0830  , 0.0819  ],
[ 0.0550  , 0.0945  , 0.0978  , 0.0990  , 0.0837  ],
[ 0.0569  , 0.1068  , 0.1005  , 0.1325  , 0.0851  ],
[ 0.0610  , nil     , 0.1013  , nil     , 0.1223  ],
[ 0.0650  , nil     , nil     , nil     , nil     ]
]

# call the methods to insert each row from the nested arrays 
# into their respective data tables
volatility_ary.each do |q1, q2, q3, q4, q5|
  add_volatility_rows(db, q1, q2, q3, q4, q5)
end

return_ary.each do |q1, q2, q3, q4, q5|
  add_return_rows(db, q1, q2, q3, q4, q5)
end


# ============================================================================
# ============================================================================
# ================================ PRINTOUTS =================================
# ============================================================================
# ============================================================================

# the first two printouts are based on the example from the kittens.rb DBC tutorial

# return_table = db.execute("SELECT * FROM return_table")
# return_table.each do |row|
#  puts "#{row['quintile_1']} | #{row['quintile_2']} | #{row['quintile_3']} | #{row['quintile_4']} | #{row['quintile_5']}"
# end
# puts "\n"

# volatility_table = db.execute("SELECT * FROM volatility_table")
# volatility_table.each do |row|
#  puts "#{row['quintile_1']} | #{row['quintile_2']} | #{row['quintile_3']} | #{row['quintile_4']} | #{row['quintile_5']}"
# end
# puts "\n"

# the following three printouts are based on the Zetcode 
# SQLite Ruby tutorial: http://zetcode.com/db/sqliteruby/queries/
puts "\n"
puts "PRINOUT OF ALL THE TABLES IN THE SIMULATIONS DATABASE:"
  db = SQLite3::Database.open "Simulations.db"
  rows = db.execute <<-SQL
    SELECT name 
    FROM sqlite_master
    WHERE type = 'table'
    ORDER BY name;
  SQL
  rows.each do |row|
    puts row
  end
  puts "\n"

puts "VOLATILITY TABLE PRINOUT (FIRST FIVE ROWS):"
db = SQLite3::Database.open "Simulations.db"
rows = db.execute2 "SELECT * FROM volatility_table LIMIT 5"
rows.each do |row|
  puts "%2s %6s %10s %10s %10s %10s" % [row[0], row[1], row[2], row[3], row[4], row[5]]
end  
puts "\n"

puts "RETURN TABLE PRINOUT (FIRST FIVE ROWS):"
db = SQLite3::Database.open "Simulations.db"
rows = db.execute2 "SELECT * FROM return_table LIMIT 5"
rows.each do |row|
  puts "%2s %8s %10s %10s %10s %10s" % [row[0], row[1], row[2], row[3], row[4], row[5]]
end  
