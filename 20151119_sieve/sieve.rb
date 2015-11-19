class Sieve
	attr_reader :primes
	def initialize(target)
		@target = target

		sieve = [2]

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
				sieve << i
			end
		end

		@primes = sieve
	end
end