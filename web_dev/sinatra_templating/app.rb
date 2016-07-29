# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

# db = SQLite3::Database.new("students.db")
db = SQLite3::Database.new("to-do-list.db")
db.results_as_hash = true

create_to_do_list = <<-SQL
  CREATE TABLE IF NOT EXISTS to_do_list(
    obs INTEGER PRIMARY KEY,
    my_jobs VARCHAR(255)
  )
SQL

db.execute(create_to_do_list)

# show the full to do list on the home page
get '/' do
  @mytodolist = db.execute("SELECT * FROM to_do_list")
  erb :home
end

get '/tasks/new' do
  erb :new_task
end

# create new tasks via a form
post '/tasks' do
  p params
  newtask = params['new_task']
  db.execute("INSERT INTO to_do_list (my_jobs) VALUES (?)", [newtask])
  redirect '/'
end



# show students on the home page
# get '/' do
#   @students = db.execute("SELECT * FROM students")
#   erb :home
# end

# get '/students/new' do
#   erb :new_student
# end

# create new students via a form
# post '/students' do
#   p params
#   name = params['name']
#   campus = params['campus']
#   age = params['age'].to_i
#   db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [name, campus, age])
#   redirect '/' # this sends the user back to the root home after saving a new student
# end
