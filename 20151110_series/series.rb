class Series
	def initialize(number)
		raise ArgumentError if number.match(/[^0-9]/)
		@base = number.chars.map {|x| [x.to_i]}
	end

	def slices(pieces)
		raise ArgumentError if pieces > @base.length
		result = []
		for i in 0..(@base.length-pieces)
			result << @base[i..(i+pieces-1)].flatten
		end
		result
	end
end