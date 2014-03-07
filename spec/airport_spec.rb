require_relative "../lib/plane.rb"

describe Plane do
	let(:plane) { Plane.new }
	it "should be able to fly" do
		expect(plane.fly).to be_true
	end
end

describe AirPort do
	let(:plane) { Plane.new }
	it "should " do
		#
	end
end
