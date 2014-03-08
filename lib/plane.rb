require_relative "./weather"
require_relative "./planeholder"
require_relative "./airport"

class Plane
	include Weather
	include Planeholder

	def initialize
		@flying
	end

	def take_off_to(sky)
		raise "Too stormy - plane cannot take off" if stormy?
		raise "No planes available" if empty
		remove_plane(plane)
	end

	def land(airport)
		raise "Too stormy - plane cannot land" if stormy?
		raise "Airport is full" if full?
		planes << plane
	end
end