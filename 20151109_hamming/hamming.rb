
class Hamming
	VERSION = 1;

	def self.compute(s1,s2)
		raise ArgumentError if (s1.length != s2.length)
		raise ArgumentError unless (s1+s2).match(/[^ATCG]/).nil?

		if s1.length == 0
			return 0
		end

		count = 0
		
		for i in (0..(s1.length-1))
			if s1[i] != s2[i]
				count = count + 1
			end
		end

		return count
	end
end