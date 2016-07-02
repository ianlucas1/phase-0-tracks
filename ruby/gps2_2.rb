# Method to create a list

# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # create a new grocery list called list
    # create the hash called list
    # pass string into method
    # split string of items into array
    # place each array item into the hash using .each
    # return list
  # set default quantity = 1
  # print the list to the console [can you use one of your other methods here?]
# output: {hash}

# Method to add an item to a list = name the method add_item
# input: existing hash (list), new item name, and quantity = pass(list,item,qty)
# steps: pass the inputs into the has
# output: {hash with the old item(s), qty, plus the new item/qty}

# Method to remove an item from the list = name the method delete_item
# input: (old hash variable, item to delete)
# steps: get rid of the item we don't want
# output: {list without the item we deleted}

# Method to update the quantity of an item = name the method update_qty
# input: pass(hash,name of existing item, new qty)
# steps: revise qty of item specified
# output: {list with same item(s), and a new qty for one of those items}

# Method to print a list and make it look pretty = name the method print_list
# input: list hash (variable name = list)
# steps: for each key-value pair in the list hash, print out the item and qty 
# output: {hash with item(s), qty} with



#def add_item(hash, new_item, qty)
#  hash[new_item] = qty
#  return hash
#end

#def delete_item(hash, item)
#  hash.delete(item)
#  return hash 
#end

#def update_qty(hash, item, new_qty)
#  hash[item] = new_qty
#  return hash
#end

#def print_list(hash)
#  hash.each { |item, qty|
#    puts "#{item}: #{qty}"
#  }
#end

#items = "carrots apples cereal pizza"
#list = create_list(items) # this calls the first method
#list = add_item(list, "cheese", 7)
#list = delete_item(list, "carrots")
#list = update_qty(list, "pizza", 2)
#print_list(list)



# Create list
def create_list(items)
  list_hash = {}
  item_ary = items.split(" ")
  item_ary.each { |item|
    list_hash[item] = 1
  }
  return list_hash
end

# Update list
def update(list, item, quantity)
  list[item] = quantity
  if quantity == 0
    list.delete(item) 
  end
end

# Print list
def print(list)
  list.each do |item, quantity|
      puts "#{item} #{quantity}"
  end
end

items = "Lemonade Tomatoes Onions Ice-Cream"
list = create_list(items)
update(list, "Lemonade", 2)
update(list, "Tomatoes", 3)
update(list, "Ice-Cream", 4)
update(list, "Lemonade", 0)
update(list, "Ice-Cream", 1)
print(list) # prints out the hash








