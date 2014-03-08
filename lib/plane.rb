require_relative "./weather"
require_relative "./planeholder"

class Plane
	include Weather
	include Planeholder

	def initialize
		@flying
	end

	def take_off_to(sky)
		raise "Too stormy - plane cannot take off" if stormy?
		planes.delete(plane)
	end

	def land(airport)
		raise "Too stormy - plane cannot land" if stormy?
		planes << plane
	end
end