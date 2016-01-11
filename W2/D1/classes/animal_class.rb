  require './flight.rb'

class Animal 
def initialize(options = {})
    default = {
      name: nil
    }
    options = default.merge(options)
      @name = options[:name]
  end
end

class Mammal < Animal

  def initialize(options = {})
    default = {
      warm_blooded: true,
      have_backbone: true,
      give_birth: true,
      give_milk: true,
       }
    options = default.merge(options)
      @warm_blooded = options[:warm_blooded]
      @have_backbone = options[:have_backbone]
      @give_birth = options[:give_birth]
      @give_milk = options[:give_milk]
  end
end

class Bat < Mammal
  def initialize(options = {})
    default = {
      wings: true,
    }
    options = default.merge(options)
    @wings = options[:wings]
    super(options)
  end
end

class Primate < Mammal
  def initialize(options = {})
    default = {
      number_legs: 2,
    }
    options = default.merge(options)
    @number_legs=options[:number_legs]
    super(options)
  end
end

class Chimpanzee < Primate
  def initialize(options = {})
    default = {
      can_grab_stuff: true
    }
    options = default.merge(options)
    @can_grab_stff = options[:can_grab_stff]
    super(options)
  end
end

class Bird < Animal
 include Flight 
  def initialize(options = {})
    default = {
      wings: true
    }
    options = default.merge(options)

    @wings = options[:wings]
    super
  end
end

class Parrot < Bird
  include Flight
  def initialize(options = {})
    super
  end
end

bird = Bird.new({name: "Jimmy"})
puts bird
bird.airspeed_velocity = 5
bird.fly

parrot = Parrot.new({name: "Parrot"})
parrot.airspeed_velocity = 6
parrot.fly