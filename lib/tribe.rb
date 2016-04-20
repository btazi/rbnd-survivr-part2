class Tribe
	attr_reader :name, :members

	def initialize(options={})
		@name = options[:name]
		@members = options[:members] || []
		puts "new tribe '#{@name}'".blue
	end

	def to_s
		@name
	end

	def tribal_council(options={})
		challenge_members = @members.clone - [options[:immune]]
		@members.delete(challenge_members.sample)
	end
end
