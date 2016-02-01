require "./25_mod.rb"

stringa = "All good things should contain at least a spoon of butter, or mascarpone zzzlast"

Ex25.methods(false).each do |method_name|		#all explicit methods from the module included.
	puts "#{method_name}:\n"
	puts Ex25.send(method_name,stringa)
	puts "\n ------------ \n"
end