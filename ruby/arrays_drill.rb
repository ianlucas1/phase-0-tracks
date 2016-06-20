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
#p all_factors = factors + new_factors
p combined_arrays = [factors, new_factors]
p combined_arrays.flatten