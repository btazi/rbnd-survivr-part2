class Game
	attr_reader :tribes, :immune

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
		members = (!@tribes[2].nil? ? @tribes[2].members : merge("new_tribe").members)
		#remove a random winner from the members listfor this challenge
		challenge_members = members.clone
		challenge_members.delete(members.sample)
		#choose randomly the eliminated contestant
		challenge_members.sample
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
		@tribes[2] =	new_tribe 
		new_tribe
	end
end
