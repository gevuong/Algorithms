# Given a boolean 2D matrix, find the number of islands. A group of connected trues forms an island. For example, the below matrix contains 5 islands. Where T is 

# Input : mat = [[T, T, F, F, F],
#                [F, T, F, F, T],
#                [T, F, F, T, T],
#                [F, F, F, F, F],
#                [T, F, T, F, T]]
# Output : 5

# Assume four edges of matrix is surrounded by water, or F

# There are 8 locations surrounding an element. 

# [[row - 1, col - 1], [row - 1, col], [row - 1, col + 1],
#  [row, col - 1,           SELF,          [row, col + 1],
#  [row + 1, col - 1], [row + 1, col], [row + 1, col + 1]]]
def num_islands(matrix)
    # for each idx, search each surrounding location of element, 
    
        # next if element is F


        # if element is T, begin search of its surrounding, start from top left corner.
        

        # if surrounding el is not in matrix, assume it's water or F, and move onto next surrounding.  


        # However, if T exists. move to that element, and implement search again (DFS). 
            # Be sure to eliminate the location you moved from as a possibility of an island

        
        # If after moving to T and surroundgs are all F, then DFS will traverse back to original location and check its remaining surroundings. 


        # Previously traversed indices must not be considered
end 





