class Airport

	DEFAULT_CAPACITY = 25

	def initialize(options = [])
		@airport
	end

	def planes
		@planes ||= []
	end

	def store_plane(plane)
		planes << plane
	end

	def plane_count
		planes.count
	end
end