require_relative 'spec_helper'

describe GiantSalmon do
  before :each do
    @salmon = GiantSalmon.new
  end

  it "should be a Fish" do
    expect(@salmon).to be_a(Fish)
  end

  it "should weigh 4 kgs" do
    expect(@salmon.weight).to eq(4)
  end

  it "should be worth 30 dollars" do
    expect(@salmon.value).to eq(30)
  end
end

describe GiantTuna do
  before :each do
    @tuna = GiantTuna.new
  end

  it "should be a Fish" do
    expect(@tuna).to be_a(Fish)
  end

  it "should weigh 2 kgs" do
    expect(@tuna.weight).to eq(2)
  end

  it "should be worth 25 dollars" do
    expect(@tuna.value).to eq(25)
  end
end
