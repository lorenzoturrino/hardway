animals = ['bear', 'ruby', 'peacock', 'kangaroo', 'whale', 'platypus']

animals.each_index {|value| puts "#{animals[value]} is at position n=#{value} and its ordinal would be #{value+1}"}