##################################
### RELEASE 2 "Business Logic" ###
##################################

# 1 At the top of your file, add a method that takes three items as parameters and returns an array of those items. So build_array(1, "two", nil) would return [1, "two", nil]. This won't take much code, but the syntax might feel a bit odd. At the bottom of the file, call the method to show that it works.

def build_array(x, y, z)
  build_array = [x, y, z]
end

# 2 At the top of your file, add a method that takes an array and an item as parameters, and returns the array with the item added. So add_to_array([], "a") would return ["a"], and add_to_array(["a", "b", "c", 1, 2], 3) would return ["a", "b", "c", 1, 2, 3]. Print a few test calls of the method.

def add_to_array(array, new_variable)
  # array = [array] << (new_variable) # 1st way, has to be followed by array.flatten
  # array = [array] + [new_variable] # 2nd way, has to be followed by array.flatten
    # array.flatten
  # [array].insert(1, new_variable).flatten # 3rd way to add a parameter
  # [array].concat([new_variable]).flatten  # 4th way to add a parameter
  [array].push(new_variable).flatten # 5th way to add a parameter 
end

####################################################
### END RELEASE 2 -- SEE BOTTOM FOR METHOD CALLS ###
####################################################

#################
### RELEASE 1 ###
#################

# 1. Initialize an empty array and store it in a variable (you can choose the name). Print the variable using p.
p factors = []

# 2. Add five items to your array. Print the array.
p factors = ["Mkt-RF", "SMB", "HML", "MOM", "RMW", "CMA"]

# 3. Delete the item at index 2. Print the array.
p factors.delete_at(2)

# 4. Insert a new item at index 2. Print the array.
p factors.insert(2, "VAR") 

# 5. Remove the first item of the array without having to refer to its index. Print the array.
p factors.delete("Mkt-RF")

# 6. Ask the array whether it includes a certain item. Print the result of this method call (labeled so it prints as more than just an isolated boolean value without any context.)
p factors.select { |v| v == "SMB" }

# 7. Initialize another array that already has a few items in it.
p new_factors = ["ACC", "LTR", "STR"]

# 8. Add the two arrays together and store them in a new variable. Print the new array.
#p combined_arrays = factors + new_factors # Alternative way to combine two arrays 
p combined_arrays = [factors, new_factors].flatten

#####################
### END RELEASE 1 ###
#####################


# Calling methods from Release 2
p build_array(1, "two", nil)
p add_to_array(["a", "b", "c", 1, 2], 3)