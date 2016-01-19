require_relative 'spec_helper'

describe Shark do
  before :each do
    @shark = Shark.new
  end

  it "should be a Fish" do
    expect(@shark).to be_a(Fish)
  end

  it "should weigh 15 kgs" do
    expect(@shark.weight).to eq(15)
  end

  it "should be worth 50 dollars" do
    expect(@shark.value).to eq(50)
  end
end
