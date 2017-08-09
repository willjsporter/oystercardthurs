module StationList
  station_list = {
    StJohnsWood: 2,
    NottingHill: 1,
    Victoria: 1,
    StJamesPark: 1,
    Balham: 3,
    Aldgate: 1,
    MileEnd: 2,
    RuislipGardens: 5,
    Cockfosters: 6
  }
end

class Station
  include StationList

  def initialize(name, zone)
    @name = name
    @zone = zone
  end

end

=begin
we want a method in oystercard such that it takes a param and then does station.new(param,zone)
where zone is defined through a hash (:station => zone#)
we'll have to store a hash of stations somewhere, maybe in a module called StationList
=end
