# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do 
  p params
  "#{params[:name]} is #{params[:age]} years old."
  name = params[:name]
  if name 
    "Hello, #{name}!"
  else
    "Hello, you!"
  end  
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

get '/students/:campus' do

  campus = params[:campus]
  students = db.execute("SELECT * FROM students") #WHERE campus=?", [params[:campus]])[0]
  response = ""
  
  students.each do |student|
    if student['campus'] == campus
      response << "Name: #{student['name']}<br>"
      response << "Age: #{student['age']}<br>"
      response << "Campus: #{student['campus']}<br><br>"
    end
  end

  return response
end


# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  # students.to_s
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  return response
end

# # write a GET route that retrieves
# # a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# http://localhost:9393/students/3


#==============================================================================

# RELEASE 0: ADD ROUTES

# 1) A /contact route that displays an address (you can make up the address).
get '/contact/:address' do
  person = params[:person]
  "#{params[:address]}"
end

# http://localhost:9393/contact/808%20Main%20Street


# 2) A /great_job route that can take a person's name as a query parameter (not a 
#    route parameter) and say "Good job, [person's name]!". If the query parameter 
#    is not present, the route simply says "Good job!"

get '/great_job/:name' do 
  # p params
  name = params[:name]
  if name 
    "Good job, #{name}!"
  else
    "Good job!"
  end  
end

# http://localhost:9393/great_job/Joe


# 3) A route that uses route parameters to add two numbers and respond with the 
#    result. The data types are tricky here -- when will the data need to be (or 
#    arrive as) a string?

get '/:num_1/:num_2' do
  num_1 = params[:num_1] 
  num_2 = params[:num_2]
  sum = num_1.to_i + num_2.to_i
  "#{sum}"
end

# http://localhost:9393/16/16


# BONUS: Make a route that allows the user to search the database in some way -- 
# maybe for students who have a certain first name, or some other attribute. If you like, 
# you can simply modify the home page to take a query parameter, and filter the students 
# displayed if a query parameter is present.

# Searching students based on the campus they attend
get '/students/:campus' do

  students = db.execute("SELECT * FROM students")
  response = ""
  
  students.each do |student|

    if student['campus'] == params[:campus]
      response << "ID: #{student['id']}<br>"
      response << "Name: #{student['name']}<br>"
      response << "Age: #{student['age']}<br>"
      response << "Campus: #{student['campus']}<br><br>"
    end

  end

  response
end

# http://localhost:9393/students/NYC


# RELEASE 1: RESEARCH ON YOUR OWN

# 1) Is Sinatra the only web app library in Ruby? What are some others?

  # If, "web app library in Ruby" is the same thing as a gem, then there appear
  # to be many such libraries.  One resource that seems to have a lot of gems
  # is called "Awesome Ruby" (http://awesome-ruby.com/).  It has the ones that
  # I have used so far (sqlite3, sinatra, and shotgun) and a bunch more.

# 2) Are SQLite and the sqlite3 gem your only options for using a database with
#    Sinatra? What are some others?

  # The answer to this is not obvious after about 10 minutes of research.  If Sinatra
  # compatibility with Ruby means that Sinatra can work with any database that works
  # with Ruby, then this might be a list of database gems that could be used with
  # Sinatra (according to Awesome Ruby):

    # DATABASE DRIVERS
    # Cassandra Driver - A pure ruby driver for Apache Cassandra with asynchronous io and configurable load balancing, reconnection and retry policies.
    # DataObjects - An attempt to rewrite existing Ruby database drivers to conform to one, standard interface.
    # mongo-ruby-driver - MongoDB Ruby driver.
    # moped - A MongoDB driver for Ruby.
    # mysql2 - A modern, simple and very fast Mysql library for Ruby (binding to libmysql).
    # Neography - A thin Ruby wrapper to the Neo4j Rest API.
    # Redic - Lightweight Redis Client.
    # redis-rb - A Ruby client that tries to match Redis’ API one-to-one, while still providing an idiomatic interface.
    # ruby-pg - Ruby interface to PostgreSQL 8.3 and later.
    # SQLite3 - Ruby bindings for the SQLite3 embedded database.
    # SQL Server - The SQL Server adapter for ActiveRecord.
    # TinyTDS - FreeTDS bindings for Ruby using DB-Library.

# 3) What is meant by the term web stack?

# A 'web stack' is a group of software programs/languages that can be used
# together to write and operate a web application.  The elements include (but
# are not limited to) an operating system, web server, database software,
# and programming language.

# One prominent web stack is LAMP (Linux, Apache, MySQL, and PHP).  A list of 
# many others is available at http://www.webopedia.com/quick_ref/webstack_acronyms.asp
