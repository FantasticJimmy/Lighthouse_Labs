module Flight
  def airspeed_velocity
    @airspeed_velocity
  end

  def airspeed_velocity=(velocity)
    @airspeed_velocity = velocity
  end
  def fly
    puts "I'm a #{@name}, flying at a speed of #{@airspeed_velocity}"
  end 
end


