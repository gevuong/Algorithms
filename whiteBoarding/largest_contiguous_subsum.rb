# longest_contiguous_subsum
# given array of integers return largest sum of contiguous integers that can be achieved

# i.e. input: [2, 3, -6, 7, -6, 7] => 8
# [ -5, -1, -3] => -1

def largest_contiguous_subsum(arr)
    # initialize to keep track of current subsum
    largest_subsum = arr[0]
    current_subsum = 0

    # iterate array
    arr.each do |el|
        current_subsum += el

        # add subsequent element to lcs
        largest_subsum = current_subsum if current_subsum > largest_subsum
        current_subsum = 0 if current_subsum < 0
    end

    largest_subsum
end

p largest_contiguous_subsum([2, 3, -6, 7, -6, 7]) == 8
p largest_contiguous_subsum([-5, -1, -3]) == -1


# My first attempt
def largest_contiguous_subsum2(arr)
    # initialize to keep track of current subsum
    largest_subsum = arr[0]
    current_subsum = 0

    # iterate array
    arr.each do |el|
        current_subsum += el
        # add subsequent element to lcs

        # reset current_subsum if < 0 because whatever integer you add to a negative sum will never be greater than the integer added to it.
        if current_subsum < 0
            largest_subsum = [largest_subsum, current_subsum].max # takes care of comparing negative subsums
            current_subsum = 0

        # reassign largest_subsum
        elsif current_subsum > largest_subsum
            largest_subsum = current_subsum
        end
    end

    largest_subsum
end

p largest_contiguous_subsum2([2, 3, -6, 7, -6, 7]) == 8
p largest_contiguous_subsum2([-5, -1, -3]) == -1
