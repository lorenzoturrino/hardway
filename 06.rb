types_of_people = 10	#2 type of people
x = "There are #{types_of_people} types of people."	#assign first string, with 1 inline string
binary = "binary"
do_not = "don't"
y = "Those who know #{binary} and those who #{do_not}." #assign second string, with 2 inline strings

puts x	#write the 2 strings assigned
puts y

puts "I said: #{x}."	#same strings again, this time inline to new strings
puts "I also said: '#{y}'."

hilarious = false	#bool
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"	#call the var inline bool->string

puts joke_evaluation	#write the string

w = "This is the left side of..."
e = "a string with a right side."

puts w + e	#define 2 strings, then puts the sum (concatenation)