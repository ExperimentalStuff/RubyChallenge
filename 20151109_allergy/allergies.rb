
class Allergies
	attr_reader :list

	@@allergen = ["cats", "pollen", "chocolate", "tomatoes", "strawberries", "shellfish", "peanuts", "eggs"] 
	@@scores = [128,64,32,16,8,4,2,1]

	def initialize(score)
		@list = get_list(score).reverse
	end

	def allergic_to?(stuff)
		@list.include?(stuff)
	end


	private
		def get_list(score)
			if score > 255
				score = score % 256
			end
			
			result= []

			@@scores.each do |item|
				if score >= item
					result << @@allergen[@@scores.index(item)]
					score = score - item
				end
			end

			return result
		end

end