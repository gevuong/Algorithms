# In this version, we can only store integers that live in a predefined range. Give max integer to store, and return a Set that can store it and any non-negative number.
class MaxIntSet
  def initialize(max)
    @store = Array.new(max) # each index in @store corresponds to an item, and value of that index will correspond to its presence (either true or false)
    # (i.e. {0, 2, 3} is stored as [true, false, true, true])
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num] # returns true or false
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length - 1)
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  # Initialize an array consisting of 20 buckets (or sub-arrays) instead of true or false.
  # You can now keep track of an arbitrary range of integers, including negative numbers
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new } # each bucket contains an empty array
  end

  def insert(num)
    # check if num is already in bucket
    raise "number already exists in bucket" if include?(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    # modulo the number by the Set's length
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end


# num_buckets as size of IntSet
# goal is to have num_buckets > N at all times
class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return "number already exists" if exist?(num)
    resize! if @count == num_buckets
    self[num].push(num)
    @count += 1
  end

  def remove(num)
    return "number does not exist" unless exist?(num)
    self[num].delete(num)
    # @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0 # or else @count = 41 instead of 21
    @store = Array.new(num_buckets * 2) {
      Array.new
    }
    old_store.flatten.each { |num| insert(num) }
  end

  def exist?(num)
    self[num].include?(num)
  end
end
