require_relative "./weather"
require_relative "./planeholder"
require_relative "./airport"

class Plane

	include Weather
	include Planeholder

	def initialize
		@flying
	end
	
	def move_plane(to, from)
		raise "Too stormy - plane cannot move plane" if stormy?
		raise "No planes available" if from.empty
		from.remove_plane(plane)
		to.planes << plane
	end
end