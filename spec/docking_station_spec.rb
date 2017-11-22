require "./lib/docking_station"
describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    station = DockingStation.new
    station.dock(Bike.new)
    bike = station.release_bike
    bike.working = true
    expect(bike).to be_working
    bike.working = false
    expect(bike).not_to be_working
    station.dock bike
    expect{station.release_bike}.to raise_error("bike not working")
  end

  it "accepts broken bikes" do
    bike = Bike.new
    bike.working = false
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
    DockingStation::DEFAULT_CAPACITY.times {station.dock(Bike.new)}
    expect {station.dock(Bike.new)}.to raise_error("docking station full")
  end

  it "accepts a capacity argument, if not capacity defaults to DEFAULT_CAPACITY" do
    expect{DockingStation.new(30)}.not_to raise_error
    expect{DockingStation.new}.not_to raise_error
  end
end
