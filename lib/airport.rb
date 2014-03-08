
require_relative "planeholder"

class Airport
	DEFAULT_CAPACITY = 25

	include Planeholder

	def initialize
		@airport
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end
end