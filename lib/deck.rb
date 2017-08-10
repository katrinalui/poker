require_relative 'card'

class Deck
  attr_accessor :cards

  SUITS = %w[♠ ♥ ♦ ♣].freeze
  VALUES = [*"2".."10"] + %w[J Q K A]

  def initialize
    @cards = create_deck
    shuffle_cards
  end

  def create_deck
    deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        deck << Card.new(value, suit)
      end
    end

    deck
  end

  def shuffle_cards
    @cards.shuffle!
  end
end
