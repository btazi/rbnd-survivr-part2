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
		@members.delete(options[:immune])
		@members.sample
	end
end
