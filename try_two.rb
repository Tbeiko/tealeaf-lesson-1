SPOTS = ["X", " ", " ",
         " ", " ", " ",
         " ", " ", "X"]
USER_MARK = "X"
CPU_MARK  = "O" 

WINNING_LINES = [[SPOTS[0], SPOTS[1],SPOTS[2]], [SPOTS[3], SPOTS[4],SPOTS[5]], [SPOTS[6], SPOTS[7],SPOTS[8]],
                 [SPOTS[0], SPOTS[3],SPOTS[6]], [SPOTS[1], SPOTS[4],SPOTS[7]], [SPOTS[2], SPOTS[5],SPOTS[8]], 
                 [SPOTS[0], SPOTS[4],SPOTS[8]], [SPOTS[2], SPOTS[4],SPOTS[6]] ]

def assert_if_two(player_mark)
  WINNING_LINES.each do |line|
    if (line == [player_mark, player_mark, " "]) || (line == [player_mark, " ", player_mark]) || (line == [" ", player_mark, player_mark])
      @two_in_a_row = true
      puts "We're onto something!" # This is for me. Will be taken off in "real program".
    else
      @two_in_a_row = false 
    end
  end
end

def defend
  # 1. Figure out where "two in a row" is
  # 2. Change the remaining " " for CPU_MARK
     
  @needs_to_play = false
end

def attack
  # 1. Figure out where the "two in a row" is
  # 2. Change the remaining " " for CPU mark

  @needs_to_play = false
end

# This is what I'd implement in my program to make the computer play. 
def computer_plays
  @needs_to_play = true

  assert_if_two(USER_MARK)
  if @two_in_a_row && @needs_to_play
    defend
  end
  assert_if_two(CPU_MARK)
  if @two_in_a_row && @needs_to_play
    attack
  end
  if @needs_to_play
    begin
      cpu_pick = rand(9)
    end while SPOTS[cpu_pick] != " "
    SPOTS[cpu_pick]    = CPU_MARK
  end

  @needs_to_play = false
end



# This is only here for reference. 
def assert_if_win(player_mark)
  winning_combination =  ((SPOTS[0] == player_mark && SPOTS[1] == player_mark && SPOTS[2] == player_mark) ||
                          (SPOTS[3] == player_mark && SPOTS[4] == player_mark && SPOTS[5] == player_mark) ||
                          (SPOTS[6] == player_mark && SPOTS[7] == player_mark && SPOTS[8] == player_mark) ||
                          (SPOTS[0] == player_mark && SPOTS[3] == player_mark && SPOTS[6] == player_mark) ||
                          (SPOTS[1] == player_mark && SPOTS[4] == player_mark && SPOTS[7] == player_mark) ||
                          (SPOTS[2] == player_mark && SPOTS[5] == player_mark && SPOTS[8] == player_mark) ||
                          (SPOTS[0] == player_mark && SPOTS[4] == player_mark && SPOTS[8] == player_mark) ||
                          (SPOTS[2] == player_mark && SPOTS[4] == player_mark && SPOTS[6] == player_mark))
  if    winning_combination && (player_mark == USER_MARK)
    puts
    puts "TIC TAC TOE"
    puts
    puts "Congragulation you won!"
    @game_still_on = false
  elsif winning_combination && (player_mark == CPU_MARK)
    puts
    puts "TIC TAC TOE"
    puts
    puts "Oh well, the computer beat you this time !"
    @game_still_on = false
  end
end

# Method from the tutorial
# def assert_two_in_a_row(array, player_mark)
#   if array.each.count(player_mark) == 2
#     two_in_a_row = true
    
#     # arr.select{|k,v| v == ' '}.keys.first
#   else
#     two_in_a_row = false
#   end
# end



assert_if_two(USER_MARK)
p SPOTS
