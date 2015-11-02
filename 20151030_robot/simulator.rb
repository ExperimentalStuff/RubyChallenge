class Robot
	attr_reader :bearing, :coordinates

	def initialize
		@directions = [:north, :east, :south, :west]
		@forward = {north: [0,1], east: [1,0], south: [0,-1], west: [-1,0]}
		@bearing = @directions[0]
		@coordinates = [0,0]
	end

	def orient(direction)
		@directions.include?(direction) ? (@bearing = direction) : (raise ArgumentError)
	end

	def at(x,y)
		@coordinates = [x,y]
	end

	def turn_right
		@bearing = @directions[(@directions.index(@bearing) + 1)%4]
	end

	def turn_left
		@bearing = @directions[(@directions.index(@bearing) - 1)%4]
	end

	def advance
		@coordinates.map!.with_index {|x,n| x + @forward[@bearing][n]}
	end

end

class Simulator
	def initialize
	end

	def instructions(command)
		raise ArgrmentError unless command.match(/[^RAL]/).nil?

		queues = []

		command.scan(/[RAL]/).each do |char|
			case char
			when 'A'
				queues << :advance
			when 'R'
				queues << :turn_right
			when 'L'
				queues << :turn_left
			end
		end

		return queues
	end

	def place(robot, order = {})
		robot.orient(order[:direction])
		robot.at(order[:x],order[:y])
	end

	def evaluate(robot, command)
		commands = instructions(command)

		commands.each do |x|
			robot.send(x)
		end
	end
end
