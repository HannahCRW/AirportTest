module Planeholder

	DEFAULT_CAPACITY = 25

	def initialize(options = [])
		@airport
	end

	def planes
		@planes ||= []
	end

	def contain_plane(plane)
		planes << plane
	end

	def plane_count
		planes.count
	end
end


class Airport
	include Planeholder
	def initialize
	end
end

# class Sky
# 	include Planeholder
# end
