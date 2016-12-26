class Card
  include Comparable
  attr_reader :number, :power
  attr_reader :suit

  def initialize(number, suit)
    @number = number
    @suit = suit
    @power = ([2, 1] + (3..13).to_a.reverse).reverse
  end

  def <=>(other)
    @power.index(@number) - @power.index(other.number)
  end
end

class Deck
  attr_reader :cards

  SUITS = %w(heart diamond spade crub).freeze

  def initialize
    @cards = SUITS.map do |suit|
      (1..13).map { |num| Card.new(num, suit) }
    end.flatten
  end

  def shuffle
    @card.shuffle
  end

  def pick!
    @card.sample(1)
  end
end

raise unless (Card.new(2, 'heart') > Card.new(3, 'diamond'))
raise unless (Card.new(4, 'heart') > Card.new(3, 'diamond'))

raise unless (Card.new(1, 'heart').suit == Card.new(3, 'heart').suit)
raise if (Card.new(1, 'diamond').suit == Card.new(3, 'heart').suit)

raise unless (Deck.new.cards.length == 52)
raise unless Deck.new.cards.length

