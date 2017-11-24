require_relative 'vans'
require_relative 'bike'
class Garage
  def initialize
    @garage_store = []
    @fixed_bikes = []
  end

  def garage_store
    @garage_store
  end

  def fixed_bikes
    @fixed_bikes
  end

  def fix
    @garage_store.each {|x| @fixed_bikes << x.working = true}
    @garage_store = []
  end
end
