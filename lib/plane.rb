require_relative "weather"

class Plane
	include Weather

	def initialize
		@flying
	end
end