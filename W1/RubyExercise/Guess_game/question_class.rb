class Question

  attr_reader :rand1, :rand2, :rand_sign, :answer, :sign

  def initialize
    @rand1 = Random.rand(21)
    @rand2 = Random.rand(21)
    @rand_sign = Random.rand(3)
    @answer = @rand_sign == 0 ? @rand1 + @rand2 : @rand_sign == 1 ? @rand1 - @rand2 : @rand1 * @rand2
    @sign = @rand_sign == 0 ? "+" : @rand_sign == 1 ? "-" : "*"        
  end

  def display
    puts "#{@rand1} #{@sign} #{@rand2}"
  end 

end