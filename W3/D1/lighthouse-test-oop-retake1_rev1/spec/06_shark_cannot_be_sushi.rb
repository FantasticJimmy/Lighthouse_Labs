require_relative 'spec_helper'

# There are fish in the sea that CANNOT be turned into sushi.
# Therefore, our Fish class will not be considered OK for sushi.
# Giant tuna and salmon are both great for sushi. Shark not so much!

describe GiantSalmon do
  # calls `sushiable?` on instance and expects back true
  it "should be be sushiable" do
    salmon = GiantSalmon.new
    expect(salmon.sushiable?).to be_truthy
  end
end

describe GiantTuna do
  # calls `sushiable?` on instance and expects back true
  it "should be be sushiable" do
    tuna = GiantTuna.new
    expect(tuna.sushiable?).to be_truthy
  end
end

describe Shark do
  # calls `sushiable?` on instance and expects back false
  it "should not be be sushiable" do
    shark = Shark.new
    expect(shark.sushiable?).to be_falsey
  end
end

# Any generic fish should not be sushiable.
# Only specific fish instances can respond with `true`
describe Fish do
  # calls `sushiable?` on instance and expects back false
  it "should not be be sushiable" do
    fish = Fish.new(1, 10)
    expect(fish.sushiable?).to be_falsey
  end
end
