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

	def vote_randomly(finalists)
		self.members.each do |jury_member|
			voted_finalist = finalists.sample.name 
			@@votes[voted_finalist.to_sym]  += 1
			puts "#{jury_member} has voted for #{voted_finalist}".yellow
		end
	end

	def report_votes(final_votes)
		final_votes.each do |key, value|
			puts "#{key} has #{value} votes".red
		end
	end

	def announce_winner(final_votes)
		winner = final_votes.max_by {|k, v| v}[0]
		puts "The last survivor is #{winner} !".green
		winner
	end
end
