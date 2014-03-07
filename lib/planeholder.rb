module Planeholder

	DEFAULT_CAPACITY = 25

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def initialize(options = [])
		@airport
	end

	def planes
		@planes ||= []
	end

	def contain_plane(plane)
		raise "Airport is full" if full?
		planes << plane
	end

	def plane_count
		planes.count
	end

	def full?
		plane_count == capacity
	end
end


class Airport
	include Planeholder
	def initialize
	end
end

class Sky
	include Planeholder
end
