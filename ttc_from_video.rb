# Initialize board hash
# Draw board
# Choose at random who goes first
# Player / Cpu has a turn if square is available
# Check for winner

# Constants
# Rows, columns and diagonals
WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]


# Markers
X = "X"
O = "O"

# Available squares
def available_squares(squares)
  squares.select{|_,v| v == " "}.keys
end

# Draw the board
def draw_board(squares)
  system 'cls'
  puts "#{squares[1]}|#{squares[2]}|#{squares[3]}"
  puts "-----"
  puts "#{squares[4]}|#{squares[5]}|#{squares[6]}"
  puts "-----"
  puts "#{squares[7]}|#{squares[8]}|#{squares[9]}"
end

# Check for winner method
def check_for_winner(line, squares)
  if    line.find {|l| l.all? {|k| squares[k] == X}}
    puts "You wins!"
    true
  elsif line.find {|l| l.all? {|k| squares[k] == O}}
    puts "Computer wins :("
    true
  end
end

# Check to see if two in a row 
def two_in_a_row(hsh, mrkr)
  if hsh.values.count(mrkr) == 2
    hsh.select{|k,v| v == " "}.keys.first
  else
    false
  end
end

# Player / Computer picks square methods
# Player
def player1(squares)
  if available_squares(squares).any?
    puts "Choose an available square from #{available_squares(squares)}"
    i = gets.chomp.to_i 
    if available_squares(squares).include?(i)
      squares[i] = X
    else
      player1(squares)
    end
    draw_board(squares)
  end
end

# Computer 
def player2(line, squares)
  puts "Computer chooses a square"
  sleep 0.5

  defend_this_square = nil
  attacked = false

  # Attack 
  WINNING_LINES.each do |l|
    defend_this_square = two_in_a_row({l[0] => squares[l[0]], l[1] => squares[l[1]], 
                                       l[2] => squares[l[2]]}, O)
    if defend_this_square
      squares[defend_this_square] = O
      attacked = true
      break
    end
  end

  # Defend 
  if attacked == false
    WINNING_LINES.each do |l|
      defend_this_square = two_in_a_row({l[0] => squares[l[0]], l[1] => squares[l[1]],
                                         l[2] => squares[l[2]]}, X)
      if defend_this_square
        squares[defend_this_square] = O
        break
      end
    end
  end

  squares[available_squares(squares).sample] = O unless defend_this_square
  draw_board(squares)
end

# Play again ?
play_again = 'y'

while play_again == 'y'

  # Initialize the empty hash that will store the positions
  board_squares = {1 => " ", 2 => " ", 3 => " ",
                   4 => " ", 5 => " ", 6 => " ",
                   7 => " ", 8 => " ", 9 => " "}

  # players stored in an array so can be chosen at random 
  players = ["player1", "player2"]

  # Setting the who goes first variable 
  goes_first = players.sample 

  # Shows players the empty board 
  draw_board(board_squares)

  # Conditional that checks which loop to execute : player1 or player 2
  if goes_first == 'player1'
    begin
      break if check_for_winner(WINNING_LINES, board_squares) == true
      player1(board_squares)
      break if check_for_winner(WINNING_LINES, board_squares) == true
      player2(WINNING_LINES, board_squares)
    end until available_squares(board_squares).empty?
  elsif goes_first == 'player2'
    begin
      break if check_for_winner(WINNING_LINES, board_squares) == true
      player2(WINNING_LINES, board_squares)
      break if check_for_winner(WINNING_LINES, board_squares) == true
      player1(board_squares)
    end until available_squares(board_squares).empty?
  end

  sleep 0.5
  puts "GAME OVER"

  # play again?
  sleep 0.5
  puts "Play again? (y/n)"
  play_again = gets.chomp 

end