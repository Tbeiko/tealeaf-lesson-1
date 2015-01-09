# tictactoe.rb 
# The player decides where he wants to put his mark
# Once he does, the computer puts their mark somewhere
# The first person to have three in a row, wins
# There can be a tie 

SPOTS = [" ", " ", " ",
         " ", " ", " ",
         " ", " ", " "]
USER_MARK = "X"
CPU_MARK  = "O"

@game_still_on = true 

def display_ttc_grid 
  empty_line      = "   |   |   "
  seperation_line = "---+---+---"
  spot_line_one   = " #{SPOTS[0]} | #{SPOTS[1]} | #{SPOTS[2]} "
  spot_line_two   = " #{SPOTS[3]} | #{SPOTS[4]} | #{SPOTS[5]} "
  spot_line_three = " #{SPOTS[6]} | #{SPOTS[7]} | #{SPOTS[8]} "
  puts empty_line
  puts spot_line_one
  puts empty_line
  puts seperation_line
  puts empty_line
  puts spot_line_two
  puts empty_line
  puts seperation_line
  puts empty_line
  puts spot_line_three
  puts empty_line
end

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

def assert_if_tie
  if     SPOTS.include?(" ")
    # Still empty spaces, the game continues
  elsif @game_still_on
    @game_still_on = false
    puts
    puts "It's a tie!"
    puts
  end
end

puts 
puts "Welcome to TicTacToe!"
puts 

begin 
  display_ttc_grid
  puts
  puts "Please select where to place your 'X'. (1-9, 1-3 is the first row, 4-6 the second and 7-9 the third.)"

  user_pick = gets.chomp.to_i
  if SPOTS[user_pick-1] != " "
    begin
      puts "That spot is already taken! Please choose another one."
      user_pick = gets.chomp.to_i
    end while SPOTS[user_pick-1] != " "
  end
  SPOTS[user_pick-1] = USER_MARK
  assert_if_win(USER_MARK)
  assert_if_tie

  if @game_still_on
    puts
    puts "The computer is strategizing ..."
    puts
    # sleep 1.5

    begin
      cpu_pick = rand(9)
    end while SPOTS[cpu_pick] != " "
    SPOTS[cpu_pick]    = CPU_MARK
    assert_if_win(CPU_MARK)
    assert_if_tie
  end 

end while @game_still_on

puts
display_ttc_grid
puts
puts "Thank you for playing!"