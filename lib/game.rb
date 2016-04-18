class Game
	attr_reader :tribes

	def initialize(tribe1, tribe2)
		@tribes = [tribe1, tribe2]
	end

	def add_tribe(tribe)
		@tribes.push(tribe)
	end

	def immunity_challenge
		@tribes.sample
	end

	def individual_immunity_challenge
		Contestant.new("Tom")
	end

	def clear_tribes
		@tribes = []
	end

	def merge(name)
		members = []
		@tribes.each do |tribe|
		 	members << tribe.members
		end
		members.flatten!
		Tribe.new(name: name, members: members)
	end
end
