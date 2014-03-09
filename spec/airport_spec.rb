require_relative "../lib/plane"
require_relative "../lib/planeholder"
require_relative "../lib/weather"
require_relative "../lib/airport"
require_relative "../lib/sky"


describe Planes do

	let(:plane) { Plane.new }
	let(:sky) { Sky.new }
	let(:airport) { Airport.new }

	def fill_airport(airport)
		25.times { airport.planes << plane }
	end

	def fill_sky(sky)
		25.times { sky.planes << plane }
	end

	it "should be able to take off" do
		plane.stub(:stormy? => false)
		fill_airport(airport)
		expect(lambda {plane.move_plane(sky, airport)}).not_to raise_error
	end

	it "should be able to land" do
		plane.stub(:stormy? => false)
		fill_sky(sky)
		expect(lambda {plane.move_plane(airport, sky)}).not_to raise_error
	end

	it "should not take off if the weather is stormy" do
		plane.stub(:stormy? => true)
		fill_airport(airport)
		expect(lambda {plane.move_plane(sky, airport)}).to raise_error
	end

	it "should not land if the weather is stormy" do
		plane.stub(:stormy? => true)
		fill_sky(sky)
		expect(lambda {plane.move_plane(airport, sky)}).to raise_error
	end

end


describe Airport do

	let(:plane) { Plane.new }
	let(:airport) { Airport.new }
	let(:sky) { Sky.new }

	def fill_airport(airport)
		25.times { airport.planes << plane }
	end

	def fill_sky(sky)
		25.times { sky.planes << plane }
	end

	it "should store planes" do
		plane.stub(:stormy? => false)
		fill_sky(sky)
		expect(airport.plane_count).to eq(0)
		plane.move_plane(airport, sky)
		expect(airport.plane_count).to eq(1)
	end

	it "should remove planes from store when they take off" do
		plane.stub(:stormy? => false)
		fill_airport(airport)
		expect(airport.planes.count).to eq(25)
		plane.move_plane(sky, airport)
		expect(airport.planes.count).to eq(24)
		# this isn't working - the plane isn't leaving
	end

	it "should know when it's full" do 
		airport.stub(:full? => true)
		expect(airport).to be_full
	end

	it "should not allow a plane to land if it is full" do
		fill_airport(airport)
		expect(lambda {plane.move_plane(airport, sky)}).to raise_error(RuntimeError)
	end

	it "should not allow a plane to leave when it's empty" do
		expect(lambda {plane.move_plane(sky, airport)}).to raise_error(RuntimeError) if airport.empty
	end
end


describe Sky do

	let(:plane) { Plane.new }
	let(:sky) { Sky.new }
	let(:airport) { Airport.new }

	def fill_airport(airport)
		25.times { airport.planes << plane }
	end

	def fill_sky(sky)
		25.times { sky.planes << plane }
	end

	it "should allow planes to be in it" do
		plane.stub(:stormy? => false)
		fill_airport(airport)
		expect(sky.plane_count).to eq(0)
		plane.move_plane(sky, airport)
		expect(sky.plane_count).to eq(1)
	end
end
