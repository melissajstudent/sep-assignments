require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @entries = 0
  end

  def []=(key, value)
    node = Node.new(key, value)
    i = index(key, self.size)
    if @items[i].nil?
      @items[i] = node
    elsif @items[i].key == key
      @items[i].value = value
      if self.next_open_index(i) == -1
        resize
      end
    else
      j = self.next_open_index(i)
      if j != -1
        @items[j] = node
      else
        resize
        self[key] = value
      end
    end
  end

  def [](key)
    # (0...size()).each do |i|
    #   if @items[i] != nil
    #     if @items[i].key == key
    #       return @items[i].value
    #     end
    #   end
    # end

    i = self.index(key, size)
    while i < size
      if @items[i].key == key
        return @items[i].value
      else
        i += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index]
      index += 1
    end
    if index >= self.size
      return -1
    else
      return index
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items.compact
    @items = Array.new(self.size * 2)
    temp.each { |node| self[node.key] = node.value }
  end

  def load_factor
    x = 0.0
    for i in 0..size-1 do
      if !@items[i].nil?
        x = x + 1
      end
    end
    x / size
  end


  # Print items hash
  def print_items
    @items.each do |i|
      if i != nil
        ind = self.index(i.key, size)
        puts "index: #{ind}, #{i.key}: #{i.value}"
      end
    end
    puts "load factor: #{load_factor()}"
  end
end
