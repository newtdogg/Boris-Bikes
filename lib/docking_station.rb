require_relative 'bike'
class DockingStation
  def initialize bikes = []
@bikes = bikes
  end
  def release_bike
    raise "no bikes to release" if @bikes.empty?
    @bikes.first
  end
  def dock bike
    raise "docking station full" if @bikes.length >= 20
    @bikes << bike
  end
  def bikes
    return @bikes
  end
end
