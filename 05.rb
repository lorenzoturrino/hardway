name = 'Boss'
age = 28
height = 180
weight = 67
eyes = 'kinda greenish brown'
teeth = 'white'
hair = 'brown'

puts "let's talk about #{name}"
puts "he's #{height} cm tall. down with stupid units."
puts "he's #{weight} kg heavy"
puts "he's got #{eyes} eyes and #{teeth} teeths, along with a nice fur of #{hair} hairs"

puts "if i add #{age}, #{weight} and #{height} i get #{age+height+weight}"

height_inch = (height * 0.393701).round
weight_pound = (weight * 2.20462).round

puts "since you insist, i'm #{height_inch} inches tall and #{weight_pound} pounds heavy"