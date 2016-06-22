#RELEASE 0
def thirsty
  customer1 = "Joe" 
  puts "Welcome to our bar!"
  yield(customer1)
end

thirsty { |customer1| puts "Glad you came, #{customer1}!" }