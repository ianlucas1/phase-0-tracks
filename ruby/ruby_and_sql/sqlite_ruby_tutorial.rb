# SQLite Ruby tutorial
# Two sections of the tutorial are not included below, but could be useful in the future:
# 1. Working with images
# 2. Transactions 

# Source: http://zetcode.com/db/sqliteruby/connect/
# This part of the SQLite Ruby tutorial will show you how to 
# connect to a database and do a few simple things with the database.
# The following code executes an SQL statement which returns 
# the version of the SQLite database.

# # use sqlite3 Ruby module to connect to the SQLite database
require 'sqlite3'

# begin

#   # create a new database object. The Database class encapsulates 
#   # a single connection to an SQLite database. The database is created 
#   # in memory. So it is not permanent.
#   db = SQLite3::Database.new ":memory:" # as opposed to db = SQLite3::Database.new("version_lookup.db")

#   # call the get_first_value method of the db object. It executes the 
#   # SQL statement and obtains the first value of the first row of a result set.
#   puts db.get_first_value 'SELECT SQLITE_VERSION()'
#   puts "\n"

# # check for errors because working with databases is error prone
# rescue SQLite3::Exception => e 

#   puts "Exception occurred"
#   puts e 

# # release the resources
# ensure
#   db.close if db 
# end


# INSERTING DATA

# We will create a Cars table and insert several rows to it.

# begin

#   # connect to the test.db database.
#   db = SQLite3::Database.open "test.db"

#   # The execute method executes the given SQL statement. 
#   # A new Cars table is created if it does not already exist.
#   db.execute "CREATE TABLE IF NOT EXISTS Cars(Id INTEGER PRIMARY KEY, 
#         Name TEXT, Price INT)"

#     # These lines insert cars into the table. Note that by default, 
#     # we are in the autocommit mode, where all changes to the table 
#     # are immediately effective.
#     db.execute "INSERT INTO Cars VALUES(1,'Audi',52642)"
#     db.execute "INSERT INTO Cars VALUES(2,'Mercedes',57127)"
#     db.execute "INSERT INTO Cars VALUES(3,'Skoda',9000)"
#     db.execute "INSERT INTO Cars VALUES(4,'Volvo',29000)"
#     db.execute "INSERT INTO Cars VALUES(5,'Bentley',350000)"
#     db.execute "INSERT INTO Cars VALUES(6,'Citroen',21000)"
#     db.execute "INSERT INTO Cars VALUES(7,'Hummer',41400)"
#     db.execute "INSERT INTO Cars VALUES(8,'Volkswagen',21600)"

#   # check for errors because working with databases is error prone
#   rescue SQLite3::Exception => e 

#     puts "Exception occurred"
#     puts e 

#   # release the resources
#   ensure
#     db.close if db 

# end


# # Sometimes we need to determine the id of the last inserted row. 
# # We use the last_insert_row_id method to find it.

# begin

#   db = SQLite3::Database.new ":memory:"

#   # We create a Friends table in memory. 
#   # The Id is automatically incremented.
#   # In SQLite, INTEGER PRIMARY KEY column is auto incremented. 
#   # There is also an AUTOINCREMENT keyword. When used in 
#   # INTEGER PRIMARY KEY AUTOINCREMENT a slightly different algorithm 
#   # for Id creation is used.
#   db.execute "CREATE TABLE Friends(Id INTEGER PRIMARY KEY, Name TEXT)"

#   db.execute "INSERT INTO Friends(Name) VALUES ('Tom')"
#   db.execute "INSERT INTO Friends(Name) VALUES ('Rebecca')"
#   db.execute "INSERT INTO Friends(Name) VALUES ('Jim')"
#   db.execute "INSERT INTO Friends(Name) VALUES ('Robert')"
#   db.execute "INSERT INTO Friends(Name) VALUES ('Julian')"

#   # Using the last_insert_row_id method, we get the 
#   # last inserted row Id.
#   id = db.last_insert_row_id
#   puts "The last id of the inserted row is #{id}"
#   puts "\n"

# rescue SQLite3::Exception => e 
    
#     puts "Exception occurred"
#     puts e
    
# ensure
#     db.close if db
# end


# In the last example of this chapter we fetch some data. More about data 
# fetching will be discussed in the Queries chapter.

# begin
    
#     db = SQLite3::Database.open "test.db"
    
#     # fetch 5 rows from the Cars table.
#     # prepare an SQL statement for execution with the prepare method. 
#     # The method returns a statement object. Then the SQL statement is 
#     # executed using the execute method. It returns a result set. 
#     # The ResultSet object is a simple cursor over the data that the 
#     # query returns.
#     stm = db.prepare "SELECT * FROM Cars LIMIT 5" 
#     rs = stm.execute 

#     # With the each method we traverse the data in the result set. In each 
#     # cycle, it returns a row. The row is an array of fields. These fields 
#     # are joined with an empty space to form a line.
#     rs.each do |row|
#       puts row.join "\s"
#     end
#     puts "\n"

#   rescue SQLite3::Exception => e 
#       puts "Exception occurred"
#       puts e
      
#   ensure
#       stm.close if stm
#       db.close if db
# end

# =======================================================================

# Doing SQL queries with Ruby in SQLite
# Source: http://zetcode.com/db/sqliteruby/queries/

# FETCHING DATA

# In the first example we fetch one row from the Cars table.
puts "\n"
puts "bind_param one row method example:"

begin
    
  db = SQLite3::Database.new "test.db"
  
  id = 1

  # The SELECT statement is prepared with the prepare method. 
  # A statement object is returned.
  stm = db.prepare "SELECT * FROM Cars WHERE Id=?"

  # A parameter is bound to the placeholder in the statement.
  stm.bind_param 1, id

  # The statement is executed. A ResultSet object is returned.
  rs = stm.execute

  # We obtain the next row from the result set. Since we want to  
  # fetch only one row, we call the next method once.
  row = rs.next
  
  # The row is a Ruby array. The three fields are joined with a 
  # space character to form a line using the join method.
  puts row.join "\s"
  puts "\n"

  rescue SQLite3::Exception => e 
    puts "Exception occurred"
    puts e
    
  ensure
    stm.close if stm
    db.close if db
end

# In the following example, we will fetch five rows. 
# We put the next method in a while loop.
puts "while loop method example:"

begin

  db = SQLite3::Database.open "test.db"
      
  # This is the SQL statement for fetching 5 rows.
  stm = db.prepare "SELECT * FROM Cars LIMIT 5"
  rs = stm.execute

  # The next method is put inside the while loop. 
  # It returns the next row from the result set. If 
  # no more rows are left, the method returns nil 
  # and the while loop is terminated.
  while (row = rs.next) do
    puts row.join "\s"
  end
  puts "\n"

  rescue SQLite3::Exception => e 
    puts "Exception occurred"
    puts e
    
  ensure
    stm.close if stm
    db.close if db
end

# We can get data from the result set using the each method.
puts ".each method example:"

begin
    
  db = SQLite3::Database.open "test.db"
      
  stm = db.prepare "SELECT * FROM Cars LIMIT 5"
  rs = stm.execute

  # We use the each method to iterate over the result set.
  rs.each do |row|
    puts row.join "\s"
  end
  puts "\n"

  rescue SQLite3::Exception => e 
    puts "Exception occurred"
    puts e
    
  ensure
    stm.close if stm
    db.close if db
end


# The next example shows the database object's execute method. 
# It is a convenience method that saves a few keystrokes.
puts "Execute convenience method example:"

begin
    
  db = SQLite3::Database.open "test.db"
  
  # Here we do two jobs in one step. We prepare 
  # the statement and execute it. The method returns 
  # the data in a Ruby array.    
  rows = db.execute "SELECT * FROM Cars LIMIT 5"

  # We print the data from the Ruby array.
  for row in rows do
    puts row.join "\s"
  end
  puts "\n"

  rescue SQLite3::Exception => e   
    puts "Exception occurred"
    puts e
    
  ensure
    db.close if db
end


# So far we have seen data returned in the form of a ResultSet or an array. 
# The next example will return the data in the form of an array of hashes. 
# This way we can identify field values by their column names.
puts "Hash example:"

begin
  
  db = SQLite3::Database.open "test.db"

  # We set the results_as_hash property to true. All rows will be returned as 
  # Hash objects, with the column names as the keys.
  db.results_as_hash = true
      
  ary = db.execute "SELECT * FROM Cars LIMIT 5"    

  # We get the fields by their column names.
  ary.each do |row|
    printf "%s %s %s\n", row['Id'], row['Name'], row['Price']
  end
  puts "\n"

rescue SQLite3::Exception => e 
    
  puts "Exception occurred"
  puts e
    
ensure
  db.close if db
end

# Fetching a row or a value

# Ruby SQLite module has two convenience methods for retrieving a row or a value. 
# In the first example, we will get a single row from a table.
puts "First of two convenience methods for retrieving a row or value:"

begin
    
  db = SQLite3::Database.open "test.db"
  
  # The get_first_row method gets the first row and discards all other rows.  
  row = db.get_first_row "SELECT * FROM Cars WHERE Id=1"       

  # The row is printed to the console.
  puts row.join "\s"
  puts "\n"

rescue SQLite3::Exception => e 
  puts "Exception occurred"
  puts e
    
ensure
  db.close if db
end


# The second convenience methods for retrieving a row or a value. 
puts "Second of two convenience methods for retrieving a row or value:"

begin
    
  db = SQLite3::Database.open "test.db"

  # With the get_first_value method we select a specific field of a row. 
  # In our case it is the price of the Bentley car.
  val = db.get_first_value "SELECT Price FROM Cars WHERE Name='Bentley'"       
  
  puts val
  puts "\n"

rescue SQLite3::Exception => e 
  puts "Exception occurred"
  puts e
    
ensure
  db.close if db
end

# =======================================================================

# BINDING PARAMETERS

# SQL statements are often dynamically built. A user provides some input and this 
# input is built into the statement. A programmer must be cautious every time he deals 
# with an input from a user. It has some serious security implications. The recommended 
# way to dynamically build SQL statements is to use parameter binding.

# When we bind parameters, we create place holders in the statement. The placeholder is 
# a special mark in the SQL statement. It is often a question mark ?. Later a parameter is 
# bound to the placeholder with a bind_param, execute, query etc. methods. Binding 
# parameters guards the program against SQL injections. It automatically escapes some 
# special characters and allows them to be handled correctly.

# Database performance is often improved when statements are prepared and their parameters 
# bound prior to statement execution. In sqlite3 Ruby module the statements are always 
# prepared. Even if we do not call the prepare method and call directly the execute method 
# of the database object, the statement is prepared behind the scenes by the sqlite3 Ruby module.


# The example selects a row from the Cars table for a specific car name.
puts "Using bind_param method to associate a variable with a placeholder character:"

begin
    
  db = SQLite3::Database.new "test.db"

  # This is a value that could come from a user: for example, from a HTML form.
  name = "Volkswagen"

  # The question mark ? is a placeholder for a value. 
  stm = db.prepare "SELECT * FROM Cars WHERE Name = ?"

  # With the bind_param method, the name variable is associated with the 
  # placeholder in the statement. The execute method will return the result set.
  stm.bind_param 1, name
  rs = stm.execute

  row = rs.next    
  puts row.join "\s"
  puts "\n"
            
rescue SQLite3::Exception => e 
  puts "Exception occurred"
  puts e
    
ensure
  stm.close if stm
  db.close if db
end


# a second way of binding parameters.
# We select a row from the Cars table for a specific Id.
puts "A second way of binding parameters:"

begin
    
  db = SQLite3::Database.new "test.db"

  # Previously we have seen a question mark as a placeholder. 
  # SQLite Ruby supports named place holders too.
  id = 4
  
  stm = db.prepare "SELECT * FROM Cars WHERE Id = :id"

  # The parameter is bound in the execute method.
  rs = stm.execute id
  
  row = rs.next    
  puts row.join "\s"
  puts "\n"

rescue SQLite3::Exception => e 
  puts "Exception occurred"
  puts e
    
ensure
  stm.close if stm
  db.close if db
end


# a third way of binding parameters.

puts "A third way of binding parameters:"

begin
  
  db = SQLite3::Database.new "test.db"

  # This time, everything (preparing the statement, 
  # binding the parameter and executing the statement) 
  # is done using one method.
  id = 3

  # The get_first_row is a convenience method, where 
  # the three actions are done in one step.
  row = db.get_first_row "SELECT * FROM Cars WHERE Id = ?", id       
  
  puts row.join "\s"
  puts "\n"

rescue SQLite3::Exception => e 
  puts "Exception occurred"
  puts e
    
ensure
  db.close if db
end


# binding several parameters in one statement.
puts "Output from example of binding several parameters in one statement:"
begin
    
  db = SQLite3::Database.new ":memory:"

  # There are three place holders in the SELECT statement. 
  stm = db.prepare "SELECT 2 + ? + 6 + ? + ?"

  # We bind three values with the bind_params method.
  stm.bind_params 3, 4, 6
  rs = stm.execute
  
  row = rs.next    
  puts row
  puts "\n"

rescue SQLite3::Exception => e 
  puts "Exception occurred"
  puts e
    
ensure
  stm.close if stm
  db.close if db
end

# =======================================================================

# GETTING SQLITE METADATA WITH RUBY

# Metadata is information about the data in a database. Metadata in SQLite 
# contains information about the tables and columns in which we store data. 
# The number of rows that an SQL statement affects is metadata. The number of 
# rows and columns returned in a result set are metadata as well.

# Metadata in SQLite can be obtained using the PRAGMA command. SQLite objects 
# may have attributes, which are metadata. Finally, we can also obtain specific 
# metadata from querying the SQLite system sqlite_master table.


# Get the column names, column types, and the number of columns of a prepared statement.
puts "GETTING METDATA"
puts "\n"

begin
    
  db = SQLite3::Database.open "test.db"

  pst = db.prepare "SELECT * FROM Cars LIMIT 6"    
  
  # These three methods return the column names, column types, and   
  # the number of columns of a prepared statement.
  puts "Column names:"
  puts pst.columns
  puts "\n"
  puts "Column types:"
  puts pst.types
  puts "\n"
  puts "Column count:"
  puts pst.column_count
  puts "\n"

rescue SQLite3::Exception => e 
  puts "Exception occurred"
  puts e
    
ensure
  pst.close if pst
  db.close if db
end


# In the next example, we issue the PRAGMA table_info(tableName) 
# command to get some metadata info about our Cars table.
puts "Using PRAGMA table_info(tableName) to get metadata about Cars table:"

begin
    
  db = SQLite3::Database.open "test.db" 
  
  # The PRAGMA table_info(Cars) command returns one row for each column 
  # in the Cars table. Columns in the result set include the column order 
  # number, column name, data type, whether or not the column can be NULL, 
  # and the default value for the column.
  stm = db.prepare "PRAGMA table_info('Cars')" 
  rs = stm.execute 

  # We iterate over the result set and print the data.
  rs.each do |row|
    puts row.join "\s"
  end
  puts "\n"

rescue SQLite3::Exception => e 
  puts "Exception occurred"
  puts e
    
ensure
  stm.close if stm
  db.close if db
end


# Next we will print 5 rows from the Cars table with their column names.
# The records are aligned with the column names.
puts "Printing rows and column names together:"

begin
    
  db = SQLite3::Database.open "test.db"

  # The execute2 method executes the given SQL statement. 
  # The first row returned is the names of the columns.
  rows = db.execute2 "SELECT * FROM Cars LIMIT 5"

  # The data is retrieved, formatted, and printed to the terminal.
  rows.each do |row|
    puts "%2s %-8s %s" % [row[0], row[1], row[2]]
  end  
  puts "\n"

rescue SQLite3::Exception => e 
  puts "Exception occurred"
  puts e
    
ensure
  db.close if db
end


# In our last example related to the metadata, we will list all tables in the test.db database.
puts "Printing all tables in the test.db database:"

begin
    
  db = SQLite3::Database.open "test.db"

  # The table names are retrieved from the sqlite_master table.
  rows = db.execute <<-SQL
          SELECT name FROM sqlite_master
          WHERE type = 'table'
          ORDER BY name;
          SQL

  rows.each do |row|
    puts row
  end

rescue SQLite3::Exception => e 
  puts "Exception occurred"
  puts e
    
ensure
  db.close if db
end



