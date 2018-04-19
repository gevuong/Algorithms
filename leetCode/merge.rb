# Given a collection of intervals, merge all overlapping intervals.
#
# Example 1:
#
# Input: [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
# Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
# Example 2:
#
# Input: [[1,4],[4,5]]
# Output: [[1,5]]
# Explanation: Intervals [1,4] and [4,5] are considerred overlapping.

# Time: O(n^2), where n is length of intervals array
# Space: O(n^2)
def merge(intervals)
    return intervals if intervals.length < 2

    # initialize min and max, and an output arr to store the updated intervals
    merged_intervals = []

    (0...intervals.length).each do |idx|

        current_min = intervals[idx].min
        current_max = intervals[idx].max

        # if condition is to skip first idx, and check if current_interval is overlapping last interval added to merged_interval. This is how I removed an interval after it's been added to merged_interval. 
        if !merged_intervals.empty?
            merged_min = merged_intervals.last.min
            merged_max = merged_intervals.last.max

            next if current_min.between?(merged_min, merged_max) && current_max.between?(merged_min, merged_max)
        end 

        (0...intervals.length).each do |idx2|
            subsequent_min = intervals[idx2].min
            subsequent_max = intervals[idx2].max

            # four conditions, to check if current interval overlaps subsequent intervals and vice versa. If so, update current_min and max 
            if subsequent_min.between?(current_min, current_max) || subsequent_max.between?(current_min, current_max) || current_min.between?(subsequent_min, subsequent_max) || current_max.between?(subsequent_min, subsequent_max)
                current_min = [subsequent_min, current_min].min
                current_max = [subsequent_max, current_max].max
            end
        end

        # after the inner loop has iterated through all possible intervals, we have obtained the current_min and max. We can then push interval to merged_intervals.
        merged_intervals.push([current_min, current_max])
    end

    # there are cases when the same interval is pushed onto merged_intervals because some intervals exists more than once. 
    merged_intervals.uniq
end

p merge([[1,3],[2,4],[5,7],[6,8]]) == [[1,4],[5,8]]
p merge([[1,3],[2,6],[8,10],[15,18]]) == [[1,6],[8,10],[15,18]]
p merge([[1,4],[4,5]]) == [[1,5]]
p merge([[1,4],[0,5]]) == [[0,5]]
p merge([[2,3],[5,5],[2,2],[3,4],[3,4]]) == [[2,4],[5,5]]

# passed 106/169 test cases on leetCode. Stumped in the following test case
# p merge([[2,3],[4,6],[5,7],[3,4]]) #== [[2,7]]
