require_relative 'station.rb'

class OysterCard
  include StationList
  attr_reader :balance, :entry_station, :journey_array

  MAX_BALANCE = 90
  DEFAULT_TOP_UP_AMOUNT = 5
  MINIMUM_CHARGE = 2

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_array = []
  end

  def top_up(value)
    raise 'Maximum balance exceeded' if value + @balance > MAX_BALANCE
    @balance += value.to_f
    "your oyster card has been topped up by £#{value.to_f}"
  end

  def tap_in(station)
    raise "Sorry, you don't have enough money! please top-up!" if @balance <= 1
    raise 'error, you have already tapped in' unless @entry_station.nil?
    @entry_station = station_rec(station)
    @journey_array << { in: station }
    "You have tapped in at #{station}"
  end

  def tap_out(station)
    @entry_station = nil
    deduct(MINIMUM_CHARGE)
    @journey_array[-1][:out] = station
    "you have tapped out at #{station}"
  end

  def station_rec(name)
    exit "Not a valid station" if station_list[name.to_sym]
    Station.new(name, station_list[name.intern])
  end

  def in_use?
    !!@entry_station
  end

  private

  def deduct(value)
    @balance -= value
  end
end

oyster=OysterCard.new
oyster.top_up(50)
oyster.tap_in("Victoria")
