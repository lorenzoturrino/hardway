the_count = (1..10).to_a

for element in the_count
	puts "element: " + element.to_s
end
puts "\n		------\n\n"

the_count.each do |element|
	puts "element: " + element.to_s
end
puts "\n		------\n\n"

the_count.reverse.each { |element| puts "element: " + element.to_s }
