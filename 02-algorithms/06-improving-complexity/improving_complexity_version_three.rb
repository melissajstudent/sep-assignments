# Create a version that improves the space complexity.
# Various data structures include linked lists, hashes, and trees. I decided to implement the heap tree structure

def heap_sort(*array)
  heapify(array.flatten!)

  the_end = array.length - 1
  while the_end > 0
    array[the_end], array[0] = array[0], array[the_end]
    the_end -= 1
    sift_down(array, 0, the_end)
  end

  array
end

def heapify(array)
  # the_start is the last parent node
  the_start = (array.length - 2) / 2
  while the_start >= 0
    sift_down(array, the_start, array.length - 1)
    the_start -= 1
  end
  array
end

def sift_down(array, the_start, the_end)
  root = the_start

  while root * 2 + 1 <= the_end
    child = root * 2 + 1
    swap = root

    if array[swap] < array[child]
      swap = child
    end

    if child + 1 <= the_end && array[swap] < array[child + 1]
      swap = child + 1
    end

    if swap != root
      array[root], array[swap] = array[swap], array[root]
      root = swap
    else
      return
    end
  end
end
