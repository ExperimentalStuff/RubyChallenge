class Luhn
	attr_reader :base, :addends, :checksum
	def initialize(number)	
		@base = number.to_s.each_char.to_a.map {|x| x.to_i}
		@addends = self.add_end(@base)
		@checksum = self.get_checksum(@addends)
	end

	def self.get_checksum(nums)
		nums.inject(0) {|x,sum| sum + x}
	end

	def self.add_end(input)
		temp = input.reverse.map.with_index do |x,i|
			if i.odd?
				(x*2 > 9) ? (x*2 - 9) : (x*2)
			else
				x
			end
		end
		temp.reverse
	end

	def get_checksum(nums)
		nums.inject(0) {|x,sum| sum + x}
	end

	def add_end(input)
		temp = input.reverse.map.with_index do |x,i|
			if i.odd?
				(x*2 > 9) ? (x*2 - 9) : (x*2)
			else
				x
			end
		end
		temp.reverse
	end

	def valid?
		@checksum % 10 == 0
	end

	def self.create(number)
		temp_base = number.to_s.each_char.to_a.map {|x| x.to_i}
		temp_base << 0
		temp_addends = self.add_end(temp_base)
		temp_checksum = self.get_checksum(temp_addends)

		if (temp_checksum % 10 != 0)
			temp_base[-1] = (10-(temp_checksum%10))
		end
		temp_base.join.to_i

	end
end