require "../lib/plane"
require "../lib/planeholder"
require "../lib/weather"
require "../lib/airport"
require "../lib/sky"


describe Planes do

	let(:plane) { Plane.new }
	let(:sky) { Sky.new }
	let(:airport) { Airport.new }

	def fill_airport(airport)
		plane.stub(:stormy? => false)
		25.times { plane.land(airport) }
	end

	it "should be able to take off" do 
		fill_airport(airport)
		plane.take_off_to(sky)
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
		plane.stub(:stormy? => false)
		25.times { plane.land(airport) }
	end

	it "should store planes" do
		expect(airport.plane_count).to eq(0)
		plane.land(airport)
		expect(airport.plane_count).to eq(1)
	end

	it "should remove planes from store when they take off" do
		fill_airport(airport)
		expect(airport.plane_count).to eq(1)
		plane.take_off_to(sky)
		expect(airport.plane_count).to eq(0)
	end

	it "should know when it's full" do 
		airport.stub(:full? => true)
		expect(airport).to be_full
	end

	it "should not allow a plane to land if it is full" do
		fill_airport(airport)
		expect(lambda {plane.land(airport)}).to raise_error(RuntimeError)
	end

	it "should not allow a plane to leave when it's empty" do
		expect(lambda {plane.take_off_to(sky)}).to raise_error(RuntimeError) if airport.empty
	end

end


describe Sky do

	let(:plane) { Plane.new }
	let(:sky) { Sky.new }
	let(:airport) { Airport.new }

	def fill_airport(airport)
		plane.stub(:stormy? => false)
		25.times { plane.land(airport) }
	end

	it "should allow planes to be in it" do
		fill_airport(airport)
		expect(sky.plane_count).to eq(0)
		plane.take_off_to(sky)
		expect(sky.plane_count).to eq(1)
	end
end
