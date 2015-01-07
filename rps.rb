# rps.rb 
# Rock Paper Scissors game

def display_pick (user_pick, computer_pick)
  puts "You chose #{user_pick} and the computer chose #{computer_pick}!"
end

def rock_paper_scissors

  loop do 

  puts "Choose one (R/P/S)."
  user_choice = gets.chomp

    if user_choice.downcase == "r"
      cpu_choice = rand(3)
      if    cpu_choice == 0
        display_pick("rock", "rock")
        puts "It's a tie !"
      elsif cpu_choice == 1
        display_pick("rock", "paper")
        puts "You lose !"
      elsif cpu_choice == 2
        display_pick("rock", "scissors")
        puts "You win !"
      end
    elsif user_choice.downcase == "p"
      cpu_choice = rand(3)
      if    cpu_choice == 0
        display_pick("paper", "rock")
        puts "You win !"
      elsif cpu_choice == 1
        display_pick("paper", "paper")
        puts "It's a tie !"
      elsif cpu_choice == 2
        display_pick("paper", "scissors")
        puts "You lose !"
      end
    elsif user_choice.downcase == "s"
      cpu_choice = rand(3)
      if    cpu_choice == 0
        display_pick("scissors", "rock")
        puts "You lose !"
      elsif cpu_choice == 1
        display_pick("scissors", "paper")
        puts "You win !"
      elsif cpu_choice == 2
        display_pick("scissors", "scissors")
        puts "It's a tie !"
      end 
    else  
      puts "Sorry, I didn't get that. Let's try again!"
    end

    begin
      puts "Play again? (y/n)"
      replay = gets.chomp.downcase
    end until (replay == 'y') || (replay == 'n')

    if replay == 'n'
      puts "Thanks for playing!"
      break
    else
      puts "Here we go!"
    end

  end

end

puts "Welcome to Rock, Paper, Scissors!"
rock_paper_scissors