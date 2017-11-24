require_relative 'garages'
class Van
  def initialize
    @van_store = []
  end
  def van_store
    @van_store
  end
  def drop_off garage
    @van_store.each {|x| garage.garage_store << x}
    @van_store = []
  end
end
