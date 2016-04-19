class Jury
	attr_accessor :members

	def initialize
		@members = []
		@@votes = {} 
	end

	def add_member(member)
		self.members.push(member)
	end

	def cast_votes(members)
		initialize_votes(members)
		vote_randomly(members)
		@@votes
	end

	def initialize_votes(members)
		members.each do |member|
			@@votes[member.name.to_sym] = 0
		end
	end

	def vote_randomly(members)
		self.members.each do |jury_member|
			vote_for = members.sample.name 
			@@votes[vote_for.to_sym]  += 1
			puts "#{jury_member} has voted for #{vote_for}"
		end
	end

	def report_votes(final_votes)
		final_votes.each do |key, value|
			puts "#{key} has #{value} votes"
		end
	end

	def announce_winner(final_votes)
		winner_votes = final_votes.values.max
		winner = final_votes.select {|k, v| v == winner_votes}.keys[0]
		puts "The last survivor is #{winner} !"
		winner
	end
end
