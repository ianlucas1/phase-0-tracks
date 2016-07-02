# RELEASE 1

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
    # create a hash data structure to hold items in the key spot and quantities as values: list
    # pass string of grocery items into method as an argument
    # split string of items into array
    # place each array item into the hash using .each
    # return the list
# set default quantity = 1
# print the list to the console
# output: {hash called list}

# Method to add an item to a list: add_item
# input: existing hash (list), new item name, and quantity = add_item(list,new_item,qty)
# steps: pass the inputs into the has
# output: {hash with the old item(s), qty, plus the new item=>qty}

# Method to remove an item from the list: delete_item
# input: (old hash variable, item to delete) = delete_item(list,item)
# steps: get rid of the item we don't want
# output: {list without the item we deleted}

# Method to update the quantity of an item: update_qty
# input: existing hash, name of existing item, new qty = update_qty(list,item,new_qty)
# steps: revise qty of item specified
# output: {list with same item(s), and a new qty for one of those items}

# Method to print a list and make it look pretty: print_list
# input: list hash = print_list(list)
# steps: for each key-value pair in the list hash, print out the item and qty 
# output: each item and its corresponding quantity on separate lines

#===========================================================#

# RELEASE 2

#  Create list
# def create_list(items)
#  hash = Hash.new
#  item_ary = items.split(" ")
#  item_ary.each { |item|  hash[item] = 1 }
#  return hash
# end

# def add_item(hash, new_item, qty)
#   hash[new_item] = qty
# end

# def delete_item(hash, item)
#   hash.delete(item)
# end

#def update_qty(hash, item, new_qty)
#   hash[item] = new_qty
#end

# def print_list(hash)
#   hash.each { |item, qty|  puts "#{item}: #{qty}" }
# end

#items = "carrots apples cereal pizza"
#list = create_list(items)
#list = add_item(list, "cheese", 7)
#list = delete_item(list, "carrots")
#list = update_qty(list, "pizza", 2)
#list = print_list(list)

#===========================================================#

# RELEASES 3 && 4

# Create list
def create_list(items)
  hash = Hash.new
  item_ary = items.split(" ")
  item_ary.each { |item|  hash[item] = nil }
  return hash
end

# This refactoring may go beyond what was intended in the guidance, 
# if the add/delete/update-qty methods were supposed to remain separate

# Modify list (to delete an item, set qty to 0)
def update(list, item, qty)
  list[item] = qty
  if qty == 0
    list.delete(item) 
  end
end

def print_list(hash)
  hash.each { |item, qty|  puts "#{item}: #{qty}" }
end

items = "Lemonade Tomatoes Onions Ice-Cream" # have to put the dash or underscore in 'Ice Cream', otherwise, string won't pass correctly
list = create_list(items)
update(list, "Lemonade", 2) # 'Ice Cream' could have been entered separately from the string, as an update without the dash or underscore
update(list, "Tomatoes", 3)
update(list, "Ice-Cream", 4)
update(list, "Lemonade", 0)
update(list, "Ice-Cream", 1)
print_list(list)









