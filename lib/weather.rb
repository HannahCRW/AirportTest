module Weather
	def weather_number; rand(100); end
end

class Storm
	include Weather
	def stormy
		@weather_number >= 80
	end
end

class Calm
	include Weather
	def calm
		@weather_number < 80
	end
end