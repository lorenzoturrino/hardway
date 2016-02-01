filename = ARGV.first

puts "opening #{filename}, please wait..."
txt = open(filename)

puts "file read. the content is:"
puts txt.read

puts "enter the name of another file \n >"
filename_2 = $stdin.gets.chomp

puts "opening #{filename_2}, please wait..."
txt = open(filename_2)

puts "file read. the content is:"
puts txt.read

txt.close()