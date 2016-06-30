# This TodoList class will contain methods to accomplish the following tasks
# do the dishes
# mow the lawn

#class TodoList

#  def initialize(@task_1, @task_2)
#    @task_1 = task_1
#    @task_2 = task_2
#  end

#  def get_items
#    list = []
#    list << TodoList.new("do the dishes", "mow the lawn")
#  end

#end


class TodoList

  # don't need these for this exercise
  #attr_reader 
  #attr_accessor :list

  def initialize(list)
    #puts "Initializing new list ..."
    @list = list
  end

  def get_items # this is a getter method
    @list
  end

  def add_item(new_item) # this is a Setter method
    @list << new_item
  end

  def delete_item(item)
    @list.delete(item)
  end

  def get_item(index)
    @list[index]
  end

end

# DRIVER CODE FOR MANUAL TESTING
#new_list = TodoList.new(["do the dishes", "mow the lawn"])
#new_list.add_item("mop")
#new_list.delete_item("do the dishes")
#p new_list.get_items
#p new_list.get_item(0)
