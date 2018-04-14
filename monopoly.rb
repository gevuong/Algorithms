## Safeway monopoly board game. I spent Friday night peeling monopoly tickets with my mom to see if we won any prizes. We had at least 100 tickets and we started by comparing each number with the numbers on the board. That caused a lot of eye strain in a short amount of time. So I wrote this algorithm instead of having to look at the physical board or use their buggy app.

def monopoly_win?(nums_arr)
    missing_nums = [108, 110, 116, 119, 121, 126, 132, 135, 138, 144, 145, 149, 154, 159, 164, 166, 172, 173, 179, 181, 182, 189, 190, 193, 193, 199, 200, 203, 206, 207, 209, 213, 218, 220, 227, 228, 235, 237, 242]

    one_to_win = [108, 119, 121, 126, 132, 135, 138, 144, 145, 149, 154, 159, 164, 166, 172, 173, 179, 213, 218, 220, 227, 228, 235, 237, 242]

    one_to_win = [ ]
    win_arr = []
    nums_arr.each do |num|
        win_arr.push(num) if one_to_win.include?(num)
    end

    nums_arr.each do |num|
        win_arr.push(num) if missing_nums.include?(num)
    end

    win_arr
end

# p monopoly_win?([147, 205, 185, 239, 167, 215, 162, 131, 202, 112, 102, 117])
# p monopoly_win?([123, 146, 139, 158, 180, 214, 175, 140, 184, 222, 168, 128])
# p monopoly_win?([156, 243, 233, 198, 188, 208, 191, 202, 225, 112, 211, 191])
# p monopoly_win?([177, 168, 184, 233, 147, 152, 168, 243, 170, 217, 142, 234])
# p monopoly_win?([229, 158, 212, 142, 140, 185, 187, 231, 117, 240, 233, 131])
# p monopoly_win?([158, 195, 111, 210, 240, 158, 106, 123, 146, 139, 222, 183])
# p monopoly_win?([131, 122, 112, 104, 230, 167, 185, 142, 219, 128, 134, 101])
# p monopoly_win?([120, 233, 140, 152, 217, 101, 174, 151, 113, 229, 241, 142])
# p monopoly_win?([128, 141, 217, 186, 191, 219, 150, 117, 184, 240, 131, 136])
# p monopoly_win?([120, 140, 197, 147, 104, 202, 143, 208, 178, 226, 140, 176])
# p monopoly_win?([204, 140, 168, 147, 170, 127, 230, 198, 215, 103, 183, 120])
# p monopoly_win?([229, 226, 157, 130, 133, 183, 187, 174, 146, 125, 176, 160])
# p monopoly_win?([217, 157, 133, 114, 219, 125, 165, 186, 122, 210, 139, 236])
# p monopoly_win?([171, 191, 109, 157, 240, 175, 163, 165, 128, 106, 192, 143])
# p monopoly_win?([191, 184, 204, 238, 148, 137, 205, 122, 197, 174, 151, 239])
# p monopoly_win?([231, 208, 170, 129, 129, 197, 127, 225, 141, 198, 196, 125])
# p monopoly_win?([103, 217, 180, 204, 151, 224, 236, 109, 162, 105, 147, 230])
# p monopoly_win?([133, 221, 157, 210, 177, 221, 231, 217, 191, 131, 148, 169])
# p monopoly_win?([150, 230, 241, 112, 122, 156, 151, 216, 226, 241, 142, 219])
# p monopoly_win?([178, 114, 103, 140, 153, 177, 183, 215, 114, 143, 162, 233])
# p monopoly_win?([155, 131, 136, 125, 134, 168, 186, 222, 123, 146, 139, 158])
# p monopoly_win?([233, 140, 162, 120, 184, 163, 130, 168, 107, 183, 175, 112])
# p monopoly_win?([111, 177, 187, 122, 167, 211, 115, 129, 183, 208, 205, 236])
# p monopoly_win?([205, 168, 107, 125, 130, 113, 133, 150, 148, 157, 131, 180])
# p monopoly_win?([157, 137, 198, 226, 146, 136, 133, 153, 241, 128, 183, 147])
# p monopoly_win?([125, 204, 143, 117, 221, 214, 142, 147, 186, 177, 141, 128])
p monopoly_win?([118, 150, 221, 225, 102, 196, 174, 129, 239, 161, 202, 137])
p monopoly_win?([122, 216, 211, 176, 233, 186, 226, 174, 224, 102, 122, 141])
p monopoly_win?([177, 169, 232, 120, 134, 236, 125, 169, 122, 137, 204, 177])
p monopoly_win?([186, 122, 114, 243])
