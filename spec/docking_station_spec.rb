require "./lib/docking_station"
describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = DockingStation.new([Bike.new]).release_bike
    expect(bike).to be_working
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

end
