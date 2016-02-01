class Riddle															#data and logic for the riddle

	def initialize(text="default riddle",sol="default solution",hint="default hint")
		@riddle_text = text
		@riddle_solution = sol
		@riddle_hint = hint
	end
	
	def solve
		puts "the text reads as follows:"
		puts @riddle_text
		puts "write 'hint' to get an hint, or put the solution directly"
		player_sol = $stdin.gets.chomp
		
		if player_sol == "hint"
			puts @riddle_hint, "\nnowplease state your answer"
			player_sol = $stdin.gets.chomp
		end
		
		if player_sol == @riddle_solution
			true
		else
			false
		end
	end
			
	def tester
		puts "Hi, this is a dump"
		p self
	end
end


class Monster															#data and logic for the monster
	
	def initialize(hp=0,atk=0)
		if hp == 0
			@monster_hp = rand(40)+10
			@monster_atk = rand(20)+5
		else
			@monster_hp = hp
			@monster_atk = atk	
		end
	end
	
	def slay
		puts "press enter to attack!"
		$stdin.gets.chomp
		puts "with a swift kick, you deal #{@monster_hp} damage and slay the monster. How convenient!\n"
		true
	end
	
	def tester
		puts "Hi, this is a dump"
		p self
	end	
end


class Ship																#contains the various rooms
	
	attr_accessor :ship_size
	attr_accessor :rooms
	
	def initialize(size=rand(4)+2)
		@ship_size = size
		@rooms = Array.new()
		size.times {@rooms.push(Room.new)}
	end
	
	def tester
		puts "Hi, this is a dump"
		p self
	end	
	
end


class Room																#contains inf on the room and gameplay
	
	def pick_description
		description_list = ["This is a green room",
				"It's very dark in here",
				"You feel something's wrong in this room ",
				"This is like the best room ever",
				"This is a dark green room",
				"This room is different from all others",
		]
		description_list.sample
	end

	def initialize
		@room_description = pick_description
		@monster_list = Array.new()
		rand(4).times {@monster_list.push(Monster.new)}
		
		if @monster_list.size == 0
			@riddle = Riddle.new("this is a riddle","cake","the solution is 'cake'")
		else
			@riddle = false
		end
	end

	def enter
		puts "\n\n\nYou enter a new room"	
		puts @room_description
		if @monster_list.length > 0
			puts "there are #{@monster_list.length} monsters in here!"
			@monster_list.each_with_index do |v,i|
				puts "get ready to fight monster n.#{i+1}"
				unless v.slay
					return false
				end
			end
			puts "\n\nCongratulations, you just killed all the monsters in this room"
		else
			puts "there are no monsters here, but you must solve something"
			unless @riddle.solve
				return false
			end
			puts "\n\nCongratulations, you solved the enigma"
		end
		true
	end
	
	def tester
		puts "Hi, this is a dump"
		p self
	end	
end

def lose
	puts "\n\nI'm sorry you managed to lose the game. gg."
	exit(1)
end

def game																						#cycle through the scenes, check status
	puts "Welcome to the playtest. the progression is linear and you can't lose from monsters. there is also no special first/last room, but everything _should_ work"
	level = Ship.new()
	puts "The ship you're about to board has #{level.ship_size} rooms and your goal is to clear them all. Good luck!"
	
	level.rooms.each do |room|
		unless room.enter
			lose
		end
	end
	
	puts "\n\n\nYou cleared all rooms, and got to the central command post. you blow it up or something, and you win!"
	exit(0)
end


game