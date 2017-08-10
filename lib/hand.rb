class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def pair?
    @cards.combination(2).find { |x, y| x == y }
  end

  def three_of_a_kind?
    @cards.combination(3).find { |x, y, z| x == y && y == z }
  end

  def four_of_a_kind?
    @cards.combination(4).find { |x, y, z, h| x == y && y == z && z == h }
  end

  def two_pair?
    @cards.combination(2).find { |x, y| x == y }
  end

  def full_house?
    three_of_a_kind + two_pair
  end

  def flush?
    @cards.all? { |card| card.suit == @cards[0].suit }
  end

  def highest_card
    @cards.max { |x, y| x <=> y }
  end

  def calculate_points
    if straight_flush?
      @cards
    elsif four_of_a_kind?
      four_of_a_kind
    elsif full_house?
      @cards
    elsif flush?
      @cards
    elsif straight?
      @cards
    elsif three_of_a_kind?
      
    elsif two_pair?
      two_pair
    elsif pair?
      pair
    else
      highest_card
    end
  end
end
