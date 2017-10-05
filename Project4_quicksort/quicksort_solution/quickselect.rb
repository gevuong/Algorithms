# Write an in-place instance method on the Array class that will find the k-th element in O(n) time.
class Array

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new{ |el1, el2| el1 <=> el2 }

    pivot_idx = start

  end

  def select_kth_smallest(k)
    left = 0
    right = self.length - 1
    while true
      return self[left] if left == right
      pivot_idx = Array.partition(self, left, right - left + 1)
      if k -1 == pivot_idx
        return self[k - 1]
      elsif k - 1 < pivot_idx
        right = pivot_idx - 1
      else
        left = pivot_idx + 1
      end
    end
  end
end
# we are eliminating one partition

# We'll have log(n) terms, but the time complexity of kth-smallest(k) is [n + n/2 + n/4 + n/8...]. Factor out n, so n*(1/2 + 1/4 + 1/8) equates to O(n) which is linear because we can ignore the constants.

arr = [1,4,2,5,3,5]
p arr.select_kth_smallest(1)
p arr.select_kth_smallest(2)
p arr.select_kth_smallest(3)
p arr.select_kth_smallest(4)
p arr.select_kth_smallest(5)
p arr.select_kth_smallest(6)
