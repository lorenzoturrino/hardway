#call with amount_files starting_number

if ARGV[0] == nil
	puts "Please call file_creator.rb amount_files starting_number"
else
	ARGV[0].to_i.times do |i|
		puts "creating #{i+ARGV[1].to_i}.rb"
		open("#{i+ARGV[1].to_i}.rb",'w').write("Exercise number: #{i+ARGV[1].to_i}")
	end
end