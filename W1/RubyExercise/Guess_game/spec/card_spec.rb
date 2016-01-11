require './../lib/card.rb'

RSpec.describe Card do
  def card(param = {})
    defaults = {
      suit: :hearts,
      rank: 7,
    }

    Card.new(**defaults.merge(param))
  end
  it 'has a suit' do
   raise unless Card.new(suit: :spades, rank: 4).suit == :spades
  end
  it 'has a rank' do
    raise unless Card.new(suit: :spades, rank: 4).rank == 4
  end

  describe 'a jack' do
    it 'ranks higher than 10' do
      low = Card.new(suit: :spades, rank: 10)
      high = Card.new(suit: :spades, rank: :jack)

      raise unless high.rank > low.rank
    end
  end
    describe 'a queen' do
    it 'ranks higher than jack' do
      low = Card.new(suit: :spades, rank: :jack)
      high = Card.new(suit: :spades, rank: :queen)

      raise unless high.rank > low.rank
    end
  end
    describe 'a king' do
    it 'ranks higher than queen' do
      low = Card.new  ({:suit=>:spades, :rank=>:queen})
      high = Card.new suit: :spades, rank: :king
      # Card.new 'namejnjn'


      raise unless high.rank > low.rank
    end
  end
end

(:suit=>:spades, :rank=>:queen)