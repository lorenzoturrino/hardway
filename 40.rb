class Song

	def initialize(lyrics=[])
		if lyrics.is_a? Array
			@lyrics = lyrics
		else
			@lyrics = lyrics.split("\n")
		end
	end
	
	def sing_it()
		@lyrics.each {|line| puts line}
	end

end


happy_bday = Song.new(["Happy birthday to you","I don't want to get sued","So I'll stop right there"])
bulls_on_parade = Song.new(["They rally around tha family\nWith pockets full of shells"])

happy_bday.sing_it()
puts "\n	 --- \n\n"
bulls_on_parade.sing_it()