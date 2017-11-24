require "./lib/docking_station"
describe DockingStation do

  it "releases working bikes" do
    station = DockingStation.new
    bike = (double :bike, working?: true)
    station.dock(bike)
    # bike.working = true
    allow(bike).to receive(:working?).and_return(true)
    expect(bike).to be_working
    # bike.working = false
    allow(bike).to receive(:working?).and_return(false)
    expect(bike).not_to be_working
    expect{station.dock bike}.not_to raise_error
    # expect{station.release_bike}.to raise_error("bike not working")
  end

  let(:bike) { double :bike }
  it "accepts broken bikes" do
    bike = double(:bike)
    # bike = Bike.new
    allow(bike).to receive(:working?).and_return(false)
    # bike.working = false
    expect {subject.dock(bike)}.not_to raise_error
  end


  it "docks bike" do
    is_expected.to respond_to :dock
  end

  it "check docked bike" do
    expect(DockingStation.new).to respond_to :bikes
  end

  it "returns error when release bike is called on empty station" do
    expect {DockingStation.new.release_bike}.to raise_error("no bikes to release")
  end

  it "returns error when dock is called but the docking station is full" do
    station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times {station.dock(double(:bike, working?: true))}
    expect {station.dock(double(:bike, working?: true))}.to raise_error("docking station full")
  end

  it "accepts a capacity argument, if not capacity defaults to DEFAULT_CAPACITY" do
    expect{DockingStation.new(30)}.not_to raise_error
    expect{DockingStation.new}.not_to raise_error
    expect(DockingStation.new.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "docking station should offload the bikes" do
    station = DockingStation.new
    van = Van.new
    bike = (double(:bike, working?: false))
    bike1 = (double(:bike, working?: false))
    station.dock(bike)
    station.dock(bike1)
    station.offload(van)
    expect((station.broken_bikes).count).to eq 0
  end

  it "drops off bikes to garage and then fixes the bikes" do
    station = DockingStation.new
    van = Van.new
    garage = Garage.new
    bike = (Bike.new)
    station.dock(bike)
    station.offload(van)
    van.drop_off(garage)
    p garage.garage_store
    garage.fixed_bikes
    p garage.fixed_bikes
    expect(garage.fixed_bikes.first).to be_working
  end
end
