def remove_duplicates(nums)
    return nil if nums.empty?
    return nums if nums.length == 1

    hash = {}
    nums.each do |el|
        hash[el] = true
    end 
    hash.keys
end

p remove_duplicates([1, 1, 2])