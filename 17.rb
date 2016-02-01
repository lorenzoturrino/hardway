=begin
source_file, target_file = ARGV

puts "hello, i'll be copying #{source_file} to #{target_file}, press any key to continue"
$stdin.gets

file_buffer = open(source_file).read

puts "source file is #{file_buffer.length} bytes long, the target file #{File.exist?(target_file) ? 'does' : 'does not'} exists"
puts "copying #{open(target_file, 'w').write(file_buffer)} bytes in new file and closing streams" 

#streams autoclosed how can i close them if no reference
=end


open(ARGV[1],'w').write(open(ARGV[0]).read)	#onelineryo.