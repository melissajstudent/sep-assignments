# Code can be optimized by pruning unused statements, assignments, or adding shortcuts such as ending a loop early if possible

def poorly_written_ruby(*arrays)
   combined_array = []
   # Combining arrays can be accomplished by one loop instead of 2
   arrays.each do |array|
     combined_array += array
   end

   # Longer statement replaced with built-in method. I assume these are optmized?
   sorted_array = [combined_array.pop]

  # The below approach eliminates if statement while keeping the number of loops at 2
  until combined_array.length == 0 # Ensures we address all elements in the combined array
      insert_value = combined_array.shift # Built-in method. Sets the first item from combined array to value to insert into sorted array. At the same time, it removes the item from combined_array, thus lowering its length by 1
      i = 0
      until i == sorted_array.length || insert_value < sorted_array[i] # This iterates through sorted array until the item that is greater than the insert value is found or end of array is reached
        i += 1
      end
      sorted_array.insert(i, insert_value) # When the insert value is less than the compared sorted_array value, it is inserted
    end

   # Return the sorted array
   sorted_array
 end
