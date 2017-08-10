require 'hand'
require 'card'
require 'byebug'

describe 'Hand' do
  let(:card1) { Card.new("2", "♠") }
  let(:card2) { Card.new("10", "♥") }
  let(:card3) { Card.new("2", "♦") }
  let(:card4) { Card.new("A", "♣") }
  let(:card5) { Card.new("5", "♦") }
  let(:cards) { [card1, card2, card3, card4, card5] }

  let(:hand) { Hand.new(cards) }

  context '#initialize' do
    it "Initializes with an array with a length of 5" do
      expect(hand.cards.length).to eq(5)
    end

    it "Initializes a hand of card objects" do
      expect(hand.cards.all? { |el| el.is_a?(Card) }).to be true
    end
  end

  context '#pair' do
    it "Hand has a pair" do
      pair = hand.pair

      expect(pair[0].value).to eq(card1.value)
      expect(pair[1].value).to eq(card3.value)
    end
  end


  context '#three_of_a_kind' do
    it "Hand has a three of a kind" do
      card5.value = "2"
      three = hand.three_of_a_kind

      expect(three[0]).to eq(card1)
      expect(three[1]).to eq(card3)
      expect(three[2]).to eq(card3)
    end
  end


  context '#full_house' do
    it "Hand has a pair and three of a kind" do
      card4.value = "10"
      card5.value = "10"
      fullhouse = hand.full_house

      expect(fullhouse[0]).to eq(card2)
      expect(fullhouse[1]).to eq(card4)
      expect(fullhouse[2]).to eq(card5)
      expect(fullhouse[3]).to eq(card1)
      expect(fullhouse[4]).to eq(card3)
    end
  end

  context '#four_of_a_kind' do
    it "Hand has a four of a kind" do
      card2.value = "2"
      card5.value = "2"
      four = hand.four_of_a_kind

      expect(four[0]).to eq(card1)
      expect(four[1]).to eq(card2)
      expect(four[2]).to eq(card3)
      expect(four[3]).to eq(card5)
    end
  end

  context '#flush' do
    it "Return has a five cards same suit" do
      card1.suit = "♦"
      card2.suit = "♦"
      card4.suit = "♦"
      flush = hand.flush
      expect(flush.all?{|card| card.suit == "♦"}).to be true
    end
  end

  context '#highest_card' do
    it "Returns the hand highest card" do
      highest = hand.highest_card

      expect(highest).to eq(card4)
    end
  end



end
