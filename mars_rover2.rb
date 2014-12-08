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
		if ( @cardinal === "N" ) && ( @y < @max_y )
			@y = @y + 1
		end

		if ( @cardinal === "E" ) && ( @x < @max_x )
			@x = @x + 1
		end

		if ( @cardinal === "S" ) && ( @y > 0 )
			@y = @y - 1
		end

		if ( @cardinal === "W" ) && ( @x > 0 )
			@x = @x - 1
		end
	end
	
	def rotate( direction )
		if ( @cardinal === "N" && direction === "right") || ( @cardinal === "S" && direction === "left")
			@cardinal="E"
		end

		if ( @cardinal === "E" && direction === "right") || ( @cardinal === "W" && direction === "left")
			@cardinal="S"
		end
		
		if ( @cardinal === "S" && direction === "right") || ( @cardinal === "N" && direction === "left")
			@cardinal="W"
		end
		
		if ( @cardinal === "W" && direction === "right") || ( @cardinal === "E" && direction === "left")
			@cardinal="N"
		end
	end
	
	def move_rover
		# take the array of instructions and move the rover
		@navigation_instructions.each do |instruction|
			case instruction
			when "L"
				self.rotate(left)
			when "R"
				self.rotate(right)
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


# get initial values from the user
puts "Max Coordinates of the plain (x [space] y):"
max_coordinates = gets.chomp
puts "Initial Rover Coordinates:"
initial_position = gets.chomp
puts "Rover Instructions:"
navigation_instructions = gets.chomp

# create a new Meal instance
this_rover = Rover.new(max_coordinates, initial_position, navigation_instructions)

this_rover.move_rover
this_rover.output_position