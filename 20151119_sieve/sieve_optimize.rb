class Sieve
	attr_reader :primes
	def initialize(target)
		@target = target

		bound = Math.sqrt(target).to_i + 1
		sieve = [2]
		above_bound = []

		# loop from 3 to target number
		for i in 3..target do

			# is_prime: flag for being prime
			is_prime = true

			# loop through each prime in sieve to check if it is divisible by the prime
			sieve.each do |denominator|
				if i%denominator==0

					# if divisible by the prime: the number checked is not a prime
					is_prime = false
					break
				end
			end

			# if the number is a prime: put into sieve for upcoming numbers
			if is_prime == true
				if i <= bound
					sieve << i
				else
					above_bound << i
				end
			end
		end

		@primes = sieve + above_bound
	end

	def self.root(num)
		Math.sqrt(num)
	end
end