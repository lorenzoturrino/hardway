def array_creator(start_num,end_num,step=1)
	numbers = []
	precision = [start_num,end_num,step].map {|value| value.to_s.split('.')[1].to_s.length}.max		#significative digits == max of significative of all inputs. double to_s to avoif nil.length err
	i = start_num.round(precision)
	while i <= end_num
		#puts "pushing #{i} to array"
		numbers.push(i)
		i = (step + i).round(precision)				#avoiding binary representation weird stuff
	end
	numbers
end

array_creator(4,10).each {|value| puts value}
puts "\n\n----------\n"
puts array_creator(-10.4,15)			
puts "\n\n----------\n"
puts array_creator(0,1,0.02)
