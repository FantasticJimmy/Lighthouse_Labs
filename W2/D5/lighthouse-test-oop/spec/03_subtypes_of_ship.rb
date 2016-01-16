require_relative 'spec_helper'

describe Cruiser do
  before :each do
    @cruiser = Cruiser.new
  end

  it "should be a ship" do
    expect(@cruiser).to be_a(Ship)
  end

  it "should have length 2" do
    expect(@cruiser.length).to eq(2)
  end

  it "should have 4 max_shots" do
    expect(@cruiser.max_shots).to eq(4)
  end
end

describe Battleship do
  before :each do
    @battleship = Battleship.new
  end

  it "should be a ship" do
    expect(@battleship).to be_a(Ship)
  end

  it "should have length 4" do
    expect(@battleship.length).to eq(4)
  end

  it "should have 4 max_shots" do
    expect(@battleship.max_shots).to eq(4)
  end
end

describe Destroyer do
  before :each do
    @destroyer = Destroyer.new
  end

  it "should be a ship" do
    expect(@destroyer).to be_a(Ship)
  end

  it "should have length 4" do
    expect(@destroyer.length).to eq(4)
  end

  it "should have 4 max_shots" do
    expect(@destroyer.max_shots).to eq(4)
  end
end
