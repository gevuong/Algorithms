def three_sum(nums)
  target = 0
  three_sum_arr = []

  nums.each_with_index do |el, idx|
    arr = []
    remainder = target - el
    arr = nums[0...idx] + nums[idx + 1..-1]

    two_int = two_sum(arr, remainder) # should return an array of two integers
    next if two_int.nil?
    p two_int
    if two_int[0] + two_int[1] == remainder
      sorted_vals = ([el] + two_int).sort

      # p sorted_vals
      three_sum_arr.push(sorted_vals) unless three_sum_arr.include?(sorted_vals)
    end
  end
  three_sum_arr

end

def two_sum(arr, remainder)
    hash = {}
    two_sum_arr = []
    arr.each_with_index do |el, idx|
        # first check if target - el
        desired_val = remainder - el
        # p desired_val
        if hash[desired_val].nil? # revert to hash to see if desired_val exists before adding new element to hash
          hash[el] = idx
          next
        else
          # return [desired_val, el]
          vals = [desired_val, el]
          two_sum_arr.push([desired_val, el]) unless two_sum_arr.include?(vals)
        end
    end
    # nil
    two_sum_arr
end

p three_sum([-4,-2,-2,-2,0,1,2,2,2,3,3,4])
