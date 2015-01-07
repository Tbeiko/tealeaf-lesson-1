# rps.rb 
# Rock Paper Scissors game

def rock_paper_scissors

	loop do 

	puts "Choose one (R/P/S)."
	user_choice = gets.chomp

		if user_choice.downcase == "r"
			cpu_choice = rand(3)
			if    cpu_choice == 0
				puts "You chose rock and the computer chose rock!"
				puts "It's a tie !"
			elsif cpu_choice == 1
				puts "You chose rock and the computer chose paper!"
				puts "You lose !"
			elsif cpu_choice == 2
				puts "You chose rock and the computer chose scissors!"
				puts "You win !"
			end
		elsif user_choice.downcase == "p"
			cpu_choice = rand(3)
			if    cpu_choice == 0
				puts "You chose paper and the computer chose rock!"
				puts "You win !"
			elsif cpu_choice == 1
				puts "You chose paper and the computer chose paper!"
				puts "It's a tie !"
			elsif cpu_choice == 2
				puts "You chose paper and the computer chose scissors!"
				puts "You lose !"
			end
		elsif user_choice.downcase == "s"
			cpu_choice = rand(3)
			if    cpu_choice == 0
				puts "You chose scissors and the computer chose rock!"
				puts "You lose !"
			elsif cpu_choice == 1
				puts "You chose scissors and the computer chose paper!"
				puts "You win !"
			elsif cpu_choice == 2
				puts "You chose scissors and the computer chose scissors!"
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