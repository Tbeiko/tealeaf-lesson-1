SPOTS = ["X", " ", " ",
         " ", " ", " ",
         " ", " ", "X"]
USER_MARK = "X"
CPU_MARK  = "O"

WINNNG_LINES = [[SPOTS[0], SPOTS[1],SPOTS[2]], [SPOTS[3], SPOTS[4],SPOTS[5]], [SPOTS[6], SPOTS[7],SPOTS[8]],
                [SPOTS[0], SPOTS[3],SPOTS[6]], [SPOTS[1], SPOTS[4],SPOTS[7]], [SPOTS[2], SPOTS[5],SPOTS[8]], 
                [SPOTS[0], SPOTS[4],SPOTS[8]], [SPOTS[2], SPOTS[4],SPOTS[6]] ]

def assert_two_in_a_row(array, player_mark)
  if array.each.count(player_mark) == 2
    two_in_a_row = true
    # Not sure if I need something like this. 
    # arr.select{|k,v| v == ' '}.keys.first
  else
    two_in_a_row = false
  end
end

# def good_computer_move(WINNNG_LINES[line], player_mark)
#   # It should find what two are in a row
#   if two_in_a_row
#     case USER_MARK
#     when WINNNG_LINES
      
#     end
#   # It should pick the "third spot"
# end


assert_two_in_a_row(WINNNG_LINES, USER_MARK)
p SPOTS