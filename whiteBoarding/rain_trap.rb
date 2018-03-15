=begin
Rain Trap
Given an array consisting of n non-negative integers representing elevation, 
compute how much water it is able to trap after raining.

             5  +
                |
             4  +
                |
             3  +                           +---+
                |                           |   |
             2  +           +---+           +-------+   +---+
                |           |   | x   x   x |   |   | x |   |
             1  +   +---+   +-------+   +-----------------------+
                |   |   | x |   |   | x |   |   |   |   |   |   |
                +-----------------------------------------------+
                  0   1   0   2   1   0   1   3   2   1   2   1 
  max_left_wall   0   1   1   2   2   2   2   3   3   3   3   3 
  max_right_wall  3   3   3   3   3   3   3   3   2   2   2   1

# [max_left, max_right].min - base
The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. 
In this case, 6 units of rainwater (labeled with an x) are being trapped. 

=end


# Iterate and switch integers between left and right pointer 
# Time: O(n/2)
# Space: O(1) in-place algorithm
def reverse_arr(arr)
    return arr if arr.length < 2

    # initialize right_pointer
    right_idx = arr.length - 1

    (0...arr.length / 2).each do |left_idx|
        # swap elements
        arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
        right_idx -= 1
    end     
    arr

end 

p reverse_arr([0]) == [0]
p reverse_arr([0, 1]) == [1, 0]
p reverse_arr([0, 1, 0, 2, 1]) == [1, 2, 0, 1, 0]
p reverse_arr([0, 1, 0, 2, 1, 0]) == [0, 1, 2, 0, 1, 0]
p reverse_arr([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) == [1, 2, 1, 2, 3, 1, 0, 1, 2, 0, 1, 0] # 12 elements
p reverse_arr([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2]) == [2, 1, 2, 3, 1, 0, 1, 2, 0, 1, 0] # 11 elements


def find_max_left_walls(arr)
    # initialize
    max_left_walls = [arr[0]] # per element
    max_left_wall = arr[0]

    (1...arr.length).each do |idx|
        current_wall = arr[idx]
        max_left_wall = [max_left_wall, current_wall].max
        max_left_walls.push(max_left_wall)
    end 
    max_left_walls

end 

p find_max_left_walls([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) == [0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3]
max_left_walls = find_max_left_walls([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])


def find_max_right_walls(arr)
    # reverse array 
    reversed_arr = reverse_arr(arr)

    # iterate using find_max_left_walls(arr)
    reversed_max_right_walls = find_max_left_walls(reversed_arr)

    # reverse array to obtain max_right_walls
    max_right_walls = reverse_arr(reversed_max_right_walls)
end 

p find_max_right_walls([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) == [3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 1]
max_right_walls = find_max_right_walls([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) 



def rain_trap(arr, max_left_walls, max_right_walls)
    count = 0
    (0...arr.length).each do |idx|
        min_max_wall = [max_left_walls[idx], max_right_walls[idx]].min
        count += min_max_wall - arr[idx]
    end 
    count 

end 


p rain_trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1], max_left_walls, max_right_walls) == 6









# first attempt
def rain_trap(arr)
    # consider if array length are all same values or if arr.length < 3
    
    # initialize three pointers: max_elevation, min_elevation, mid_elevation
    min_elevation = 0 
    mid_elevation = [] # can have multiple values
    max_elevation = 0
    
    # iterate array check if value is greater than 0. 
    (1...arr.length).each_with_index do |idx, idx2|
        prev_elevation = arr[idx - 1]
        current_elevation = arr[idx]
        
        next if current_elevation == prev_elevation
        
        # meaning there's a rise in elevation
        if current_elevation > prev_elevation 
            # elevation could be the mid or max elevation
            mid_elevation.push(current_elevation) # [1, 2]
            max_elevation = [current_elevation, max_elevation].max
            
        # there's a drop in elevation
        elsif current_elevation < prev_elevation 
            min_elevation = [current_elevation, min_elevation].min
        
            
        end 
            
            
    end 
    # Once you find initial_el > 0, store el in variable 
    
    # continue iterating until you encounter a value smaller than the initial_el
    
    
    # also log the element when it is greater than low_point = elevation
    
    
    # 
    
end 