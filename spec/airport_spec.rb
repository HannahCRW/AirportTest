require_relative "../lib/plane.rb"
require_relative "../lib/planeholder.rb"
require_relative "../lib/weather.rb"

describe Plane do
	let(:plane) { Plane.new }
	it "should be able to fly" do
		expect(plane.fly).to be_true
	end
end

describe Airport do

	let(:plane) { Plane.new }
	let(:airport) { Airport.new }

		def fill_airport(airport)
		25.times { airport.contain_plane(Plane.new) }
		end

	it "should store planes" do
		expect(airport.plane_count).to eq(0)
		airport.contain_plane(plane)
		expect(airport.plane_count).to eq(1)
	end

	it "should know when it's full" do 
		expect(airport).not_to be_full
		fill_airport(airport)
		expect(airport).to be_full
	end

	it "should not allow a plane to land if it is full" do
		fill_airport(airport)
		expect(lambda {airport.contain_plane(plane) }).to raise_error(RuntimeError)
	end
end

describe Weather do # ???

	let(:plane) { Plane.new }
	let(:airport) { Airport.new }

	context "storm " do
		it "should prevent planes from taking off" do
			stormy = double(:stormy, {:weather_number => 90})
			# stormy take off = false
		end
		it "should prevent planes from landing" do
			stormy = double(:stormy, {:weather_number => 90})
			# stormy land = false
		end
	end

	context "calm " do
		it "should allow planes to take off" do
			calm = double(:calm, :weather_number => 40)
			# calm take off = true
		end
		it "should allow planes to land" do
			calm = double(:calm, :weather_number => 40)
			# calm land = true
		end
	end
end
