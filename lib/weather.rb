module Weather
	def weather_number; rand(100); end

	def stormy?
		weather_number >= 80
	end
end

class WeatherEffect
	def initialize
	end
end	