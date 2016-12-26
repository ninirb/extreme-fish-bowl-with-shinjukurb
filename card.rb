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
      (1..13).map { |num| Card.new(num, suit) } end.flatten
  end

  def shuffle
    @cards.shuffle
  end

  def pick!
    @cards.pop
  end
end

class Player
  attr_reader :cards
  def initialize

  end
end

_player1 = Player.new
_player2 = Player.new


class CardSet

end
