class ValueError < Exception
end

class Board

	def self.transform(input)
		check_length(input)
		check_board(input)

		y_limit = input.length - 2
		x_limit = input[0].length - 2

		output = input.map(&:dup)

		for y in 1..y_limit do
			for x in 1..x_limit do
				if output[y][x]=='*'
					output[y-1][x-1] = change_char(output[y-1][x-1])
					output[y-1][x] = change_char(output[y-1][x])
					output[y-1][x+1] = change_char(output[y-1][x+1])
					output[y][x-1] = change_char(output[y][x-1])
					output[y][x+1] = change_char(output[y][x+1])
					output[y+1][x-1] = change_char(output[y+1][x-1])
					output[y+1][x] = change_char(output[y+1][x])
					output[y+1][x+1] = change_char(output[y+1][x+1])
				end
			end
		end

		return output
	end

	#private

		def self.check_length(input)
			raise ValueError unless (input.map {|x| x.length}.uniq.length == 1)
		end

		# obsolete: function replaced directly by check_board
	#	def check_char(input)
	#		raise ValueError, 'invalid char included' unless input.join('').match(/[^\s\+\-\|\*]/).nil?
	#	end


		def self.check_board(input)
			raise ValueError unless input[0].match(/^\+\-+\+$/)
			raise ValueError unless input[-1].match(/^\+\-+\+$/)
			for i in 1..(input.length-2) do
				raise ValueError unless input[i].match(/^\|(\s*\**)*\|$/)
			end
		end

		def self.change_char(char)
			chars = [' ','1','2','3','4','5','6','7','8']
			if chars.index(char)
				return chars[chars.index(char)+1] 
			else
				return char
			end
		end
end