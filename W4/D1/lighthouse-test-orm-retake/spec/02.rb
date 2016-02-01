require './spec_helper'

describe Suite do
  
  before :each do
    @suite = FactoryGirl.build :suite
  end

  describe '#number' do
    it "is required" do
      @suite.number = nil
      expect(@suite).to_not be_valid
      expect(@suite.errors[:number]).to eq ["can't be blank"]
    end
    it "cant be longer than 3 letters" do
      @suite.number = '1355' # 4 letters
      expect(@suite).to_not be_valid
      expect(@suite.errors[:number]).to eq ["is too long (maximum is 3 characters)"]
    end
    it "must be unique" do
      another_suite = FactoryGirl.create :suite
      @suite.number = another_suite.number

      expect(@suite).to_not be_valid
      expect(@suite.errors[:number]).to eq ['has already been taken']
    end
  end

  describe '#rate' do
    it "is required (can't be nil; must be a number)" do
      @suite.rate = nil
      expect(@suite).to_not be_valid
      expect(@suite.errors[:rate]).to eq ["is not a number"]
    end

    it "cannot be zero (must be greater)" do
      @suite.rate = 0
      expect(@suite).to_not be_valid
      expect(@suite.errors[:rate]).to eq ["must be greater than 0"]
    end

    it "must be a number (integer) only" do
      @suite.rate = 'abc'
      expect(@suite).to_not be_valid
      expect(@suite.errors[:rate]).to eq ["is not a number"]
    end
  end

  describe '#capacity' do
    it "is required to be number" do
      @suite.capacity = nil
      expect(@suite).to_not be_valid
      expect(@suite.errors[:capacity]).to eq ["is not a number"]
    end

    it "cannot be zero (must be greater)" do
      @suite.capacity = 0
      expect(@suite).to_not be_valid
      expect(@suite.errors[:capacity]).to eq ["must be greater than 0"]
    end

    it "must be a number (integer) only" do
      @suite.capacity = 'abc'
      expect(@suite).to_not be_valid
      expect(@suite.errors[:capacity]).to eq ["is not a number"]
    end
  end

end
