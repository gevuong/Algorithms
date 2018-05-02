class LinkedList
    attr_accessor :key, :val, :head, :tail
    def initialize(key = nil, val = nil) 
        @key = key 
        @val = val
        @head = nil
        @tail - nil
    end 
end 

class HashMap
    def initialize(num_buckets = 8)
        @store = Array.new(num_buckets) { LinkedList.new }
        @count = 0
    end 

    # every key should be unique. want to check if key is already in the store.
    def include?(key)
        @store[key.hash % num_buckets].include?(key)
    end 

    def set(key, val)
        resize! if @count >= num_buckets
        if include?(key)
            @store[key.hash % num_buckets].update(value)
    end 

    def get(key)
        @store[key.hash % num_buckets]
    end 

    def resize!
        old_store = @store 
        

    end 

    # every key is unique
    # def bucket(key)
    #     @store[key.hash & num_buckets]
    # end 
end
