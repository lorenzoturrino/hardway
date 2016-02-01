cars = 100
car_passengers = 4.0 # will cascade float to all results calling it.i get 0.75 people per car and not 0
drivers = 30
total_passengers = 90

#calc part
cars_not_driven = cars - drivers	#resting cars
cars_driven = drivers	#1 driver per car
carpool_max_capacity = cars * car_passengers #n of people a whole fleet can carry
carpool_actual_capacity = cars_driven * car_passengers #actual number of people we can carry with the give drivers
average_car_passengers = total_passengers / cars_driven #how many passengers per car. on average
used_actual_capacity = total_passengers / carpool_actual_capacity #% of usage of the active fleet

puts "there are #{cars} cars available, of which #{cars_driven} are used to ferry #{total_passengers} people around"
puts "on average each car will have #{average_car_passengers} passengers on it, occupying #{used_actual_capacity} of the capacity of the cars in use"
puts "with enough drivers, we'd be able to transport #{carpool_max_capacity} people at capacity"