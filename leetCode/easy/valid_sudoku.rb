# Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.

# The Sudoku board could be partially filled, where empty cells are filled with the character '.'.

# Note:
# A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.

def is_valid_sudoku(board)
    # board is a 2D array 
    # rule 1: Each row has numbers 1 through 9 occurring just once. 
    # check to see if there are any numbers that are less than 1 or greater than 9, if there are any duplicates.
    board.each do |row|
        filled_row = row.delete(".")
        return false if filled_row.uniq != filled_row
    end 

    # rule 2: each column has numbers 1 through 9 occurring just once.
    (0..8).each do |col|
        filled_col = []
        filled_grid = []
        (0..8).each do |row|
            el = board[row][col]
            filled_col.push(el) if el != "."
            filled_grid.push(el)
        end 
        return false if filled_col.uniq != filled_col
    end 
    
    # rule 3: each sub_grid must contains numbers 1 to 9 occurring just once.
    filled_grid = []
    i = 0
    j = 0

    [0, 3, 6].each do |row|
        [0, 3, 6].each do |col|
            board[row][col + 3]
        end 
    end 

    true 
end

def valid_row(row)
    filled_row = []
    row.each do |el|
        filled_row.push(el)
    end 
end 
p is_valid_sudoku([[".","8","7","6","5","4","3","2","1"],["2",".",".",".",".",".",".",".","."])
