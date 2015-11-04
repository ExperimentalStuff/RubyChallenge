class Queens
	attr_reader :white, :black

	def initialize(input = {})
		@white = input[:white] || [0,3]
		@black = input[:black] || [7,3]
		raise ArgumentError if @white == @black

		@board = []
		setup_board
	end

	def to_s
		@board.map {|x| x.join(" ")}.join("\n")
	end

	def attack?
		(@white[0]==@black[0]) || (@white[1]==@black[1]) || ((@white[0]-@black[0]).abs == (@white[1]-@black[1]).abs)
	end

	private

		def setup_board
			(1..8).each { |y| @board << ("_" * 8).split("")}
			@board[@white[0]][@white[1]] = 'W'
			@board[@black[0]][@black[1]] = 'B'
		end




end