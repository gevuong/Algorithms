# Given a 2D array, print it in spiral form. See the following examples.
#
# Input:
#         1    2   3   4
#         5    6   7   8
#         9   10  11  12
#         13  14  15  16
# Output:
# 1 2 3 4 8 12 16 15 14 13 9 5 6 7 11 10
#
#
# Input:
#         1   2   3   4  5   6
#         7   8   9  10  11  12
#         13  14  15 16  17  18
# Output:
# 1 2 3 4 5 6 12 18 17 16 15 14 13 7 8 9 10 11

# Assume number of elements in each sub_arr is consistent
def spiral_matrix(arr)
  return arr[0] if arr.length == 1

  start_row = 0
  end_row = arr.length - 1
  start_col = 0
  end_col = arr[0].length - 1

  output = []

  # use "<=" instead of "<" because even if start_row == end_row, we need to make sure the elements that run from top to bottom are included in output. Same with start_col == end_col.
  while start_row <= end_row && start_col <= end_col

    # top left to right
    (start_col..end_col).each do |col_idx|
      row_el = arr[start_row][col_idx]
      output.push(row_el)
    end
    start_row += 1

    # begin at second row (starat_row + 1)
    # top to bottom (from right side of arr)
    (start_row..end_row).each do |row_idx|
      col_el = arr[row_idx][end_col]
      output.push(col_el)
    end
    end_col -= 1

    # need two if conditions because matrix may not be a square. So if row_length > col_length, we need to continue adding elements to output from right to left.
    if start_row <= end_row
      # begin at second to last column (end_col - 1)
      # bottom right to left
      end_col.downto(start_col) do |col_idx|
        row_el = arr[end_row][col_idx]
        output.push(row_el)
      end
      end_row -= 1

    end

    if start_col <= end_col
      # begin at second to last row (end_row - 1)
      # bottom to top (from left side of arr)
      end_row.downto(start_row) do |row_idx|
        col_el = arr[row_idx][start_col]
        output.push(col_el)
      end
      start_col += 1

    end
  end
  output

end


# Test cases
arr = [[1, 2, 3, 4]]

arr0 = [[1, 2, 3, 4],
       [5, 6, 7, 8]]

arr1 = [[1, 2, 3, 4],
       [5, 6, 7, 8],
       [9, 10, 11, 12],
       [13, 14, 15, 16]]

arr2 = [[1, 2, 3, 4, 5, 6],
       [7, 8, 9, 10, 11, 12],
       [13, 14, 15, 16, 17, 18]]

arr3 = [[1, 7, 13],
        [2, 8, 14],
        [3, 9, 15],
        [4, 10, 16],
        [5, 11, 17],
        [6, 12, 18]]

p spiral_matrix(arr)
p spiral_matrix(arr0)
p spiral_matrix(arr1)
p spiral_matrix(arr2)
p spiral_matrix(arr3)
p spiral_matrix(arr) == [1, 2, 3, 4]
p spiral_matrix(arr0) == [1, 2, 3, 4, 8, 7, 6, 5]
p spiral_matrix(arr1) == [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10]
p spiral_matrix(arr3) == [1, 7, 13, 14, 15, 16, 17, 18, 12, 6, 5, 4, 3, 2, 8, 9, 10, 11]
p spiral_matrix(arr2) == [1, 2, 3, 4, 5, 6, 12, 18, 17, 16, 15, 14, 13, 7, 8, 9, 10, 11]
