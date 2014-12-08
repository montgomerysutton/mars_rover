#define the class
class Rover

	def initialize (max_coordinates, initial_position, navigation_instructions)
		@max_coordinates = max_coordinates.split(/ /)
		@max_x = @max_coordinates[0].to_i
		@max_y = @max_coordinates[1].to_i
		
		@initial_position = initial_position.split(/ /)
		@x = @initial_position[0].to_i
		@y = @initial_position[1].to_i
		@cardinal = @initial_position[2]

		@navigation_instructions = navigation_instructions.chars.to_a
	end
    
	def advance_rover
		#move the rover forward one point in the proper direction
		if ( @cardinal == "N" ) and ( @y < @max_y )
			@y = @y + 1
		end

		if ( @cardinal == "E" ) and ( @x < @max_x )
			@x = @x + 1
		end

		if ( @cardinal == "S" ) and ( @y > 0 )
			@y = @y - 1
		end

		if ( @cardinal == "W" ) and ( @x > 0 )
			@x = @x - 1
		end
	end
	
	def rotate( direction )
		if ( @cardinal == "N" and direction == "R") or ( @cardinal == "S" and direction == "L")
			@cardinal="E"
		elsif ( @cardinal == "E" and direction == "R") or ( @cardinal == "W" and direction == "L")
			@cardinal="S"
		elsif ( @cardinal == "S" and direction == "R") or ( @cardinal == "N" and direction == "L")
			@cardinal="W"
		elsif ( @cardinal == "W" and direction == "R") or ( @cardinal == "E" and direction == "L")
			@cardinal="N"
		end
	end
	
	def move_rover
		# take the array of instructions and move the rover
		@navigation_instructions.each do |instruction|
			case instruction
			when "L"
				self.rotate("L")
			when "R"
				self.rotate("R")
			when "M"
				self.advance_rover
			else
				puts "#{instruction} is an invalid instruction for the Rover."
			end
		end
	end

	def output_position
		puts "#{@x} #{@y} #{@cardinal}"
	end

end

# Set Starting Rover Number
rover_number = 1
rovers = Array.new

# get initial values from the user
puts "Max Coordinates of the plain (x [space] y):"
max_coordinates = gets.chomp

loop do
	puts "Initial Rover Coordinates (x [space] y [space] N, S, E, or W):"
	initial_position = gets.chomp

	puts "Rover Instructions (L for left, R for right, M for move forward one spot - no spaces!):"
	navigation_instructions = gets.chomp

	# create a new Rover instance
	rovers.push( Rover.new(max_coordinates, initial_position, navigation_instructions) )

	puts "Create additional Rover? (Y/N)"
	additional_rover = gets.chomp

	rover_number += 1

	break if additional_rover == "N"
end

rovers.each do |rover|
	rover.move_rover
	rover.output_position
end