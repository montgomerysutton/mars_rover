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

		# puts "Max X: #{@max_x}"
		# puts "Max Y: #{@max_y}"
		# puts "Initial X: #{@x}"
		# puts "Initial Y: #{@y}"
		# puts "Initial Cardinal: #{@cardinal}"
	end
    
	def advance_rover
		#move the rover forward one point in the proper direction
		case @cardinal
		when "N"
			if @y < @max_y
				@y = @y + 1
				#puts "Move 1 place forward to the N, #{@y}."
			else
				#puts "Reached max y position of #{@max_y}."
			end
		when "E"
			if @x < @max_x
				@x = @x + 1
				#puts "Move 1 place forward to the E, #{@x}."
			else
				#puts "Reached max x position of #{@max_x}."
			end
		when "S"
			if @y > 0
				@y = @y - 1
				#puts "Move 1 place forward to the S, #{@y}."
			else
				#puts "Reached min y position of 0."
			end
		when "W"
			if @x > 0
				@x = @x - 1
				#puts "Move 1 place forward to the N, #{@x}."
			else
				#puts "Reached min y position of 0."
			end
		end
	end
	
	def rotate_right
	    #rotate the rover 90 degrees to the right
	    case @cardinal
		when "N"
			@cardinal="E"
			#puts "Turn right from N to E"
		when "E"
			@cardinal="S"
			#puts "Turn right from E to S"
		when "S"
			@cardinal="W"
			#puts "Turn right from S to W"
		when "W"
			@cardinal="N"
			#puts "Turn right from W to N"
		end
	end
	
	def rotate_left
		#rotate the rover 90 degrees to the left
		case @cardinal
		when "N"
			@cardinal="W"
			#puts "Turn left from N to W"
		when "E"
			@cardinal="N"
			#puts "Turn left from E to N"
		when "S"
			@cardinal="E"
			#puts "Turn left from S to E"
		when "W"
			@cardinal="S"
			#puts "Turn left from W to S"
		end
	end
	
	def move_rover
		# take the array of instructions and move the rover
		@navigation_instructions.each do |instruction|
			case instruction
			when "L"
				self.rotate_left
			when "R"
				self.rotate_right
			when "M"
				self.advance_rover
			else
				puts "Invalid instruction for the Rover."
			end
		end
	end

	def output_position
		puts "#{@x} #{@y} #{@cardinal}"
	end

end


# get initial values from the user
puts "Max Coordinates of the plain:"
max_coordinates = gets.chomp
puts "Initial Rover Coordinates:"
initial_position = gets.chomp
puts "Rover Instructions:"
navigation_instructions = gets.chomp

# create a new Meal instance
this_rover = Rover.new(max_coordinates, initial_position, navigation_instructions)

this_rover.move_rover
this_rover.output_position
