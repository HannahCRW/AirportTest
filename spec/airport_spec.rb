require "plane"
require "planeholder"
require "weather"
require "airport"
require "sky"


describe Plane do
	let (:plane) { Plane.new }
	let (:airport) { Airport.new }

	it "should" do
		#
	end

end

describe WeatherEffect do

	let(:plane) { Plane.new }
	let(:sky) { Sky.new }
	let(:airport) { Airport.new }

	it "should be able to take off" do 
		plane.stub(:stormy? => false)
		expect(lambda {plane.take_off_to(sky)}).not_to raise_error
	end

	it "should be able to land" do
		plane.stub(:stormy? => false)
		expect(lambda {plane.land(airport)}).not_to raise_error
	end

	it "should not take off if the weather is stormy" do
		plane.stub(:stormy? => true)
		expect(lambda {plane.take_off_to(sky)}).to raise_error
	end

	it "should not land if the weather is stormy" do
		plane.stub(:stormy? => true)
		expect(lambda {plane.land(airport)}).to raise_error
	end
end


describe Airport do

	let(:plane) { Plane.new }
	let(:airport) { Airport.new }
	let(:sky) { Sky.new }

		def fill_airport(airport)
		25.times { airport.contain_plane(Plane.new) }
		end

	it "should store planes" do
		expect(airport.plane_count).to eq(0)
		airport.contain_plane(plane)
		expect(airport.plane_count).to eq(1)
	end

	it "should remove planes from store when they take off" do
		airport.contain_plane(plane)
		expect(airport.plane_count).to eq(1)
		planeholder.take_off_to(sky)
		expect(airport.plane_count).to eq(0)
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

	it "should know when it's empty" do
		expect(airport).to be_empty
	end

	it "should not allow a plane to leave when it's empty" do
	end

end


describe Sky do

	let(:plane) { Plane.new }
	let(:sky) { Sky.new }

	it "should allow planes to be in it" do
		expect(sky.plane_count).to eq(0)
		sky.contain_plane(plane)
		expect(sky.plane_count).to eq(1)
	end
end
