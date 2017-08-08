
class OysterCard
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    raise 'Maximum balance exceeded' if value + @balance > MAX_BALANCE
    @balance += value.to_f
    "your oyster card has been topped up by £#{value.to_f}"
  end

  def deduct(value)
    @balance -= value
  end

  def tap_in
    if @balance <= 1 
      raise "Sorry, you don't have enough money! please top-up!"
    elsif @in_use == true
      raise 'error, you have already tapped in'
    else
      @in_use = true
      'You have tapped in'
    end
    end

  def tap_out
    @in_use = false
    deduct(5)
  end

  def in_use?
    if @in_use == true
      true
    else
      false
    end
  end
end

