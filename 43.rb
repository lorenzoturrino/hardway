class Engine

	def initialize(first_room="entrance",player_name="Nameless")
		@player_name = player_name
		@first_room = first_room
		introduction
	end
	
	def introduction
		puts "hello #{@player_name}, get ready to enter the #{@first_room}"
	end
	
	def game
		playfield = Scene.new
		
		next_room = playfield.enter_room("entrance")
		while(true)																																								#dovrà ricevere next/lose, pescare next o winda mappa					
			case next_room
				when "lose" then lose
				when "win" then win
				else next_room = playfield.enter_room(next_room)
			end
		end
		
	end
	
	def win
		puts "you win, gratz"
		exit(0)
	end
	
	def lose
		puts "you lose, bye"
		exit(1)
	end
end


class StarshipMap																									#struttura delle rooms e contenuti
	

end


class Room																												#gens random rooms
	
	attr_accessor :monster_list
	attr_accessor :monster_number
	
	def initialize
		puts "initalizing monsters and riddles"
		seed_obstacles
		puts "we have #{@monster_number}: #{@monster_list}"
	end
	
	def seed_obstacles																							#n of monsters and maybe a riddle
		@monster_number = rand(4)
		if @monster_number == 0
			@riddle = rand > 0.5 ? true : false
		else
			monster_setup
			@riddle = false
		end
	end
	
	def monster_setup
		@monster_list = []
		@monster_number.times {@monster_list.push(Monster.new)}				#array of monster object each with hp/atk
	end

	def tester
		puts "we #{@monster_number}"
	end
end


class Monster																										#stats of the monster

	attr_accessor :monster_hp
	attr_accessor :monster_atk
	
	def initialize(monster_hp=0,monster_atk=0)
		@monster_hp = monster_hp == 0 ? rand(50) : monster_hp
		@monster_atk = monster_atk == 0 ? rand(10) : monster_atk
	end

end


class Riddle																										#puzzle to solve

	def run
		"\n\nRiddle:on a scale from one to ten, you are a nine."
		"sometime i'll put a puzzle here, now you get a pass"
		true
	end
	
end


class Scene																									#room logic
	
	def initialize
		@rooms = {																									#da spostare nella mappa
			"entrance" => "this is the entrance" ,
			"main_room" =>  "this is the main room" ,
			"exit" => "this is the exit"
		}
	end
	
	def enter_room(room_name)																									#stub. dovrà leggere le info delle stanze
		puts "\n\nyou enter a new room: #{@rooms[room_name]}"
		puts "now going to combat mode"
		
		battaglia = Combat.new
		battaglia.fight ? "main_room" : "lose"																								#ritornerà next_room/lose
	end
	
end

class Combat

	def initialize(monster_hp=50, player_hp=100)
		@monster_hp = monster_hp
		@player_hp = player_hp
		puts "a big monster appears!"
	end

	def fight()																									#implementare combat
		puts "you face the enemy, press enter to win!"
		$stdin.gets.chomp
		puts "you win"
		true
	end
	
end

stanza = Room.new
puts "\n\n-----"
stanza.monster_list.each {|monster| puts "monster has #{monster.monster_atk}atk and #{monster.monster_hp}hp"}


=begin
ciao = Engine.new
ciao.game
=end