$powerup_strength = false
$powerup_dagger = false

def die(death_code=0)
	
	puts case death_code
		when 0 then "you stumble on your own legs and fall face-first into a random spike"
		when "snakes" then "paralyzed, you slowly get dissolved by the venom"
		when "rockfall" then "as soon as you do that, the ceiling falls on you and you get crushed"
		when "bear_charge" then "while cozy, the build quality of the dungeon is also questionable. the bear smashes through the door, and jumps on you"
		when "bear_eat" then "you struggle with the bear for a while, but you get overpowered and he eats you face"
		when "apple" then "ever heard of snow white? the apple was poisoned. such a surprise."
		when "spiders" then "the spiders quickly spin you in a cocoon, slowly digesting and eating you."
		when "vampire" then "after a quick struggle, the vampire overpowers you and suck your neck dry"
		
		else "A mysterious, giant BUG appears from nowhere and eats you"
	end
	
	puts "You're dead. have a nice day"
	exit(1)
	
end

def good_end(escape_code=0)
	
	puts case escape_code
		when 0 then "not everybody is made to be a hero, but at least you're alive. I guess it's back to videogames for you"
		when 1 then "congratulations, you manage to escape the dungeon with a bountiful loot! you didn't kill the vampire, but who cares. Not your problem right?"
		when 2 then "congratulations, you liberated the dungeon! the nearby villages proclaim you an hero, and on top of that you get to keep the whole treasure. you get a 5/7 performance rating!"
	end
	
	exit(0)
		
end

def room_1
	puts "\nAs soon as you open the door, you see hundreds of snakes moving on the floor a short distance from you \n"
	
	puts "\nThere is 1 door, what is your action?"
	puts "1: sure of your boyscout training, you scare the snakes away"
	puts "2: you use your swiss knife to attack the snakes"
	puts "3: you close the door and go back where you came from"
	print "	>  "
	choice = $stdin.gets.chomp.to_i
	
	case choice
		when 1,2
			puts "the snakes attack, and you get bitten all over your body"
			die("snakes")
		when 3
			puts "you quickly slam the door shut and go back"
			room_2
		else die
	end
	
end

def room_2
	puts "\nThe room is empty, and you see 4 doors, what's your action?"
	puts "1: go west"
	puts "2: go north"
	puts "3: go east"
	puts "4: go south and exit the dungeon"
	print "	>  "
	choice = $stdin.gets.chomp.to_i
	
	case choice
		when 1 
			puts "you take the door on the western side of the room"
			room_1
		when 2 
			puts "you take the door on the northern side of the room"
			room_5
		when 3
			puts "you take the door on the eastern side of the room"
			room_3
		when 4
			puts "you decide you had enough and exit the dungeon"
			good_end
		else die
	end
	
end

def room_3
	puts "\nThis room is empty, but you hear a strange rumbling from the cieling"
	
	puts "There are 2 doors, what's your action?"
	puts "1: go west"
	puts "2: go north"
	puts "3: slowly inspect the room, checking for hidden levers"
	print "	>  "
	choice = $stdin.gets.chomp.to_i
	
	case choice
		when 1
			puts "you take the door on the western side of the room"
			room_2
		when 2
			puts "you take the door on the northern side of the room"
			room_4
		when 3
			puts "in the center of the room you find a hidden pressure plate, which you cautiosly activate"
			die("rockfall")
		else die	
	end
	
end

def room_4
	puts "\nYou encounter the bear from the previous dungeon, which has decided to settle here. He's made a sensible choice you think, as this room has way less humidity infiltrations and is more spacious. He still seems angry at you."
	
	puts "There are 2 doors and the bear is charging at you, what's your action?"
	puts "1: escape west"
	puts "2: escape south"
	puts "3: attack the bear"
	print "	>  "
	choice = $stdin.gets.chomp.to_i
	
	case choice
		when 1,2		
			puts "you rush for the door, and close it behind you"
			die("bear_charge")
		when 3
			if powerup_dagger == true 
				room_4_clear
			else
				die("bear_eat")
			end
		else die
	end
	
end

def room_4_clear
	puts "\nWith a big effort and the help of your weapon, you manage to subdue the bear long enough to move safely to a different room"
	
	puts "There are 2 doors, what's your action?"
	puts "1: go west"
	puts "2: go south"
	puts "3: stay in the room, waiting for the bear to regain his strength."
	print "	>  "
	choice = $stdin.gets.chomp.to_i
	
	case choice
		when 1
			puts "you take the door on the western side of the room"
			room_5
		when 2
			puts "you take the door on the southern side of the room"
			room_3
		when 3
			puts "Honestly that's just plain stupid"
			die("bear_eat")
		else die	
	end
	
end

def room_5
	puts "\nAt the center of the room there is a big banquet, with tons of stuff to eat."
	
	puts "There are 4 doors, what's your action?"
	puts "1: go west"
	puts "2: go north"
	puts "3: go east"
	puts "4: go south"
	puts "5: eat an apple"
	puts "6: eat some grilled meat"
	print "	>  "
	choice = $stdin.gets.chomp.to_i
	
	case choice
		when 1
			puts "you take the door on the western side of the room"
			room_6
		when 2
			puts "you take the door on the northern side of the room"
			room_8
		when 3
			puts "you take the door on the eastern side of the room"
			room_4
		when 4
			puts "you take the door on the southern side of the room"
			room_2
		when 5
			puts "you take a bite out of an apple"
			die("apple")
		when 6
			puts "you feast on the meat, and feel a newfound strength rushing through your veins."
			$powerup_strength = true
			room_5
		else die
	end
	
end

def room_6
	puts "\nWeirdly, this room is totally empty. You should manage not to die here."
	
	puts "There are 2 doors, what's your action?"
	puts "1: go north"
	puts "2: go east"
	puts "3: chill here for a while"
	print "	>  "
	choice = $stdin.gets.chomp.to_i	
	
	case choice
		when 1
			puts "you take the door on the northern side of the room"
			room_7
		when 2
			puts "you take the door on the eastern side of the room"
			room_5
		when 3
			puts "you relax in the room for a while."
			room_6
		else die
	end
end

def room_7
	puts "\nThis room is crawling with spiders of all sizes and types. At the far end you notice a small chest"	
	
	if $powerup_dagger == true
		puts "the spiders waited for your return and made a trap"
		die("spiders")
	end
	
	puts "There is 1 door, what's your action?"
	puts "1: go south"
	puts "2: dodge the spiders and open the chest"
	puts "3: torch the whole place down"
	print "	>  "
	choice = $stdin.gets.chomp.to_i	
	
	case choice
		when 1
			puts "you take the door on the southern side of the room"
			room_6
		when 2
			puts "you avoid the spiders, but as soon as you kneel to open the chest, they're on top of you"
			die("spiders")
		when 3
			puts "the smoke from the fire sends the spiders away, for a while at least."
			puts "inside the chest you find a silver dagger, a powerful relic from the past"
			puts "weird how powerful monsters always keep stuff able to kill them lying around in their dungeon"
			puts "you take the dagger and go back from where you came"
			$powerup_dagger = true
			room_6
		else die
	end
	
end

def room_8
	puts '','This room is empty, but there is an inscription on the floor: 
	/\ Boss Room
		> Treasure Room
	\/ Banquent Room
	How convenient!'
	
	puts "There are 3 doors, what's your action?"
	puts "1: go north"
	puts "2: go east"
	puts "3: go south"
	print "	>  "
	choice = $stdin.gets.chomp.to_i	
	
	case choice
		when 1
			puts "you take the door on the northern side of the room"
			room_boss
		when 2
			puts "you take the door on the eastern side of the room"
			room_9
		when 3
			puts "you take the door on the southern side of the room"
			room_5
		else die
	end
end

def room_9
	puts "\nYou found the treasure room! Hoardes of riches glitter before your own eyes. Still, you know their guardian must be not too far off."
	
	puts "There is 1 door, what's your action?"
	puts "1: go west"
	puts "2: admire the treasure"
	puts "3: load as much gold as you can and run"
	print "	>  "
	choice = $stdin.gets.chomp.to_i	
	
	case choice
		when 1
			puts "you take the door on the eastern side of the room"
			room_8
		when 2
			puts "while looking at the treasure, you hear something behind you, and you turn around"
			room_boss
		when 3
			puts "while you're busy stuffing your pouches, the vampire comes out of nowhere. you use your quick quake3-trained reflexes to jump out of his way, and run for the exit."
			if $powerup_strength == true
				puts "Luckily, you're faster than him thanks to the meal you ate before"
				good_end(1)
			else
				puts "Sadly, you're too slow, and he quickly catches up to you"
				die("vampire")
			end
		else die
	end
	
end

def room_boss
	puts "\nA vampire! not a Ekimma, nor a Bruxa, but a full higher vampire!"
	if $powerup_dagger && $powerup_strength
		puts "using your full force and the dagger your found, you manage to engage the vampire on equal footing."
		puts "after a short and anticlimactic battle (sorry, got bored of writing stuff) you kill the vampire and teabag him a little."
		good_end(2)
	else
		die("vampire")
	end
end

puts "You enter the dungeon, wishing for riches and an excuse to get away from your mother in law. You know that a powerful vampire resides here, and that only a equally powerful artifact can slay him."
room_2