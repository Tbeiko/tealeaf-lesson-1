# calculator.rb 

puts "Welconme to Tim's Calculator !"

def say msg
	puts "=> #{msg}"
end

loop do 

	say "Please enter your first number"
	num1 = gets.chomp 

	say "Please enter your second number"
	num2 = gets.chomp 

	puts "------------------------------------"
	say "What operatiion do you want to perform?"
	say "1 = Addition"
	say "2 = Substraction"
	say "3 = Multiplication"
	say "4 = Division"
	puts "------------------------------------"

	operation = gets.chomp
	if    operation == "1"
		total = num1.to_i + num2.to_i
		say "The total is #{total} !"
	elsif operation == "2"
		total = num1.to_i - num2.to_i
		say "The total is #{total} !"
	elsif operation == "3"
		total = num1.to_i * num2.to_i
		say "The total is #{total} !"
	elsif operation == "4"
		if num2 == "0"
			say "Error! Cannot divide by zero!"
		else
		total = num1.to_f / num2.to_f
		say "The total is #{total} !"
	  end
	else
		say "Error, that was not a valid operation!"
	end

	say "Do you want to do another calculation? (Yes/No)"
	go_again = gets.chomp.downcase
	break if (go_again != 'yes') && (go_again != "y")

end

say "Thanks for using my calculator!"