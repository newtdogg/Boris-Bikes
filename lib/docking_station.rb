require_relative 'bike'
require_relative 'garages'
require_relative 'vans'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :broken_bikes, :bikes
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end
  def release_bike
    raise "no bikes to release" if empty?
    @bikes.first
  end

  def dock bike
    raise "docking station full" if full?
    if bike.working?
      @bikes << bike
    else
      @broken_bikes << bike
    end
  end
  def bikes
    return @bikes
  end

  def offload van
    @broken_bikes.each {|x| van.van_store.push(x)}
    @broken_bikes = []
  end

  private
  def full?
    (@broken_bikes.length + @bikes.length) >= @capacity
  end
  def empty?
    @bikes.empty?
  end
end
