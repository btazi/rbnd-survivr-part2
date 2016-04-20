class Game
	attr_reader :tribes, :immune

	def initialize *tribes
		@tribes = tribes
	end

	def add_tribe(tribe)
		@tribes.push(tribe)
	end

	def immunity_challenge
		@tribes.sample
	end

	def individual_immunity_challenge
		@tribes.first.members.sample
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
		new_tribe = Tribe.new(name: name, members: members)
		clear_tribes
		add_tribe new_tribe
		new_tribe
	end
end
