require_relative 'bike'
class DockingStation
  DEFAULT_CAPACITY = 20
  def initialize bikes = []
@bikes = bikes
  end
  def release_bike
    raise "no bikes to release" if empty?
    @bikes.first
  end
  def dock bike
    raise "docking station full" if full?
    @bikes << bike
  end
  def bikes
    return @bikes
  end

  private
  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end
  def empty?
    @bikes.empty?
  end
end
