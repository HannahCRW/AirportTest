require_relative "./plane"

module Planeholder

	DEFAULT_CAPACITY = 25

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def planes
		@planes ||= []
	end

	def plane  # this is where my problem is
		@plane
	end

	def remove_plane(plane)
		planes.delete(plane)
	end

	def plane_count
		planes.count
	end

	def full?
		plane_count == capacity
	end

	def empty
		plane_count == 0
	end
end
