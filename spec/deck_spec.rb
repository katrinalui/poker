require 'deck'

describe 'Deck' do
  subject(:deck) { Deck.new }
  let(:cards) { deck.cards }

  context '#initialize' do
    it "Initialize with a deck of 52 cards" do
      expect(cards.length).to eq(52)
    end

    it "Initializes with a deck of unique cards" do
      (cards.length - 1).times do |i|
        (i + 1...cards.length).each do |j|
          card1 = [cards[i].value, cards[i].suit]
          card2 = [cards[j].value, cards[j].suit]
          expect(card1).to_not eq(card2)
        end
      end
    end

    it "Cards should be shuffled" do
      order_deck = []
      Deck::SUITS.each do |suit|
        Deck::VALUES.each do |value|
          order_deck << Card.new(value, suit)
        end
      end

      expect(cards).to_not eq(order_deck)
    end
  end
end
