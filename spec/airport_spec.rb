require_relative "../lib/plane.rb"

describe Plane do
	let(:plane) { Plane.new }
	it "should be able to fly" do
		expect(plane.fly).to be_true
	end
end

describe Airport do

	let(:plane) { Plane.new }
	let(:airport) { Airport.new }

	it "should store planes" do
		expect(airport.plane_count).to eq(0)
		airport.store_plane(plane)
		expect(airport.plane_count).to eq(1)
	end
end

describe Weather do # ???

	let(:plane) { Plane.new }
	let(:airport) { Airport.new }

	context "storm " do
		it "should prevent planes from taking off" do
			#
		end
	end

	context "calm " do
		it "should allow planes to take off" do
			#
		end
	end
end
