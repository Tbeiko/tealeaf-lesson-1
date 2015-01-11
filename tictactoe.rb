# tictactoe.rb 
# The player decides where he wants to put his mark
# Once he does, the computer puts their mark somewhere
# The first person to have three in a row, wins
# There can be a tie 

# @spots = [" ", " ", " ",
#           " ", " ", " ",
#           " ", " ", " "]

USER_MARK = "X"
CPU_MARK  = "O"

WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

@game_still_on = true 

def display_ttc_grid 
  empty_line      = "   |   |   "
  seperation_line = "---+---+---"
  spot_line_one   = " #{@spots[0]} | #{@spots[1]} | #{@spots[2]} "
  spot_line_two   = " #{@spots[3]} | #{@spots[4]} | #{@spots[5]} "
  spot_line_three = " #{@spots[6]} | #{@spots[7]} | #{@spots[8]} "
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


def assert_if_win(lines, spots)
  if lines.find {|l| l.all? {|k| spots[k-1] == USER_MARK}}
    puts
    puts "TIC TAC TOE"
    puts
    display_ttc_grid
    puts
    puts "Congragulations you won!"
    @game_still_on = false
  elsif lines.find {|l| l.all? {|k| spots[k-1] == CPU_MARK}}
    puts
    puts "TIC TAC TOE"
    puts
    display_ttc_grid
    puts
    puts "Oh well, the computer beat you this time !"
    @game_still_on = false
  end
end

def assert_if_tie
  if     @spots.include?(" ")
    # Still empty spaces, the game continues
  elsif @game_still_on
    @game_still_on = false
    puts
    puts "It's a tie!"
    puts
  end
end

def two_in_a_row(hsh, player_mark)
  if hsh.values.count(player_mark) == 2
    hsh.select{|k,v| v == " "}.keys.first
  else
    false
  end
end

def computer_moves(line, squares)
    puts
    puts "The computer is strategizing ..."
    puts
    sleep 0.5

    defend_this_square = nil 
    attacked = false 
    needs_to_play = true

    # Attack
    WINNING_LINES.each do |l| 
      defend_this_square = two_in_a_row({l[0] => squares[l[0]-1], l[1] => squares[l[1]-1], l[2] => squares[l[2]-1]}, CPU_MARK)
      if defend_this_square
        squares[defend_this_square-1] = CPU_MARK
        attacked = true 
        needs_to_play = false
        break
      end
    end

    # Defend 
    if attacked == false
      WINNING_LINES.each do |l|
        defend_this_square = two_in_a_row({l[0] => squares[l[0]-1], l[1] => squares[l[1]-1], l[2] => squares[l[2]-1]}, USER_MARK)
        if defend_this_square
          squares[defend_this_square-1] = CPU_MARK
          needs_to_play = false
          break
        end
      end
    end

    unless defend_this_square
      begin
        cpu_pick = rand(9)
      end while @spots[cpu_pick] != " "
      @spots[cpu_pick]    = CPU_MARK
    end
end

puts 
puts "Welcome to TicTacToe!"
puts 

begin 

  want_to_play = true 
  @spots = [" ", " ", " ",
            " ", " ", " ",
            " ", " ", " "]

  begin 

    display_ttc_grid
    puts
    puts "Please select where to place your 'X'. (1-9, 1-3 is the first row, 4-6 the second and 7-9 the third.)"
    user_pick = gets.chomp.to_i

    if @spots[user_pick-1] != " "
      begin
        puts "That spot is already taken! Please choose another one."
        user_pick = gets.chomp.to_i
      end while @spots[user_pick-1] != " "
    end
    @spots[user_pick-1] = USER_MARK
    assert_if_win(WINNING_LINES, @spots)
    assert_if_tie

    if @game_still_on
      computer_moves(WINNING_LINES, @spots)
      assert_if_win(WINNING_LINES, @spots)
      assert_if_tie
    end 
  end while @game_still_on

  puts "Do you want to play again? (yes/no)"
  want_to_play = gets.chomp.downcase
  if want_to_play == 'yes' || want_to_play == 'y'
    @game_still_on = true 
    true
  else
    @game_still_on = false
    false
    break
  end

end while want_to_play

puts
puts "Thank you for playing!"