puts "count the chickens"

puts "Hens#{2+25+3/10}" #no need for space to #{}
puts "Roosters #{10-9}. this is going to be hectic" # only 1 rooster allowed


puts "What about the eggs?"

puts 10.0 / 3.0	#float result
puts 10.0 % 3.0 #float result but int operations

puts "is 3 + 2 < 5 - 7?"
puts 3+2 < 5-7 #true/false/dare

puts "the first term is #{3.0+2}, the second #{5-7.5}" #half float half int
puts "so that's pretty obvious"

puts "let's compare 5 and -2"
puts "greater? #{5>-2}, maybe greater or equal? #{5>=-2}. Then strictly less i guess...#{5<-2}" #multiple inclusion


puts "rather than a new file, let me just put it here: SUM1..10 is equal to #{(10+1)*(10/2)} and #{(1..10).reduce(:+)}" #and a array reduction
