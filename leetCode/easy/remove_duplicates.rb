# Given a sorted array, remove the duplicates in-place such that each element appear only once and return the new length.

# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

def remove_duplicates(nums)
  # edge cases 
  return nums if nums.length < 2
  
  # initialize
  idx_uniq = 0
  
  (0...nums.length).each do |idx| 
    if  nums[idx] != nums[idx + 1]
      nums[idx_uniq] = nums[idx] 
      idx_uniq += 1
    end 
  end 
  nums[0...idx_uniq]
  
end 

p remove_duplicates([1,1,2]) == [1, 2]
p remove_duplicates([1]) == [1]
p remove_duplicates([1,1,2,2,2,2, 3, 3, 4, 4, 5]) == [1, 2, 3, 4, 5]
p remove_duplicates([1,2,2]) == [1, 2]