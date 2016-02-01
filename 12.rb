print "Give me a number: "
number = gets.chomp.to_i

bigger = number * 10
puts "A bigger number is #{bigger}."

print "Give me another number: "
number = gets.chomp.to_f		#change type


smaller = number / 10
puts "A smaller number is #{smaller}."