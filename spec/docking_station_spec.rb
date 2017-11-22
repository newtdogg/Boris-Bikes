require "./lib/docking_station"
describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "releases working bikes" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "docks bike" do
    is_expected.to respond_to :dock
  end

  it "check docked bike" do
    expect(DockingStation.new).to respond_to :bike
  end

end
