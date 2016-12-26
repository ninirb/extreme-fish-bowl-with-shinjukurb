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

  def initialize(players)
    @cards = SUITS.map do |suit|
      (1..13).map { |num| Card.new(num, suit) } end.flatten
    @players = players
  end

  def shuffle
    @cards.shuffle
  end

  def distribute
    until @cards
      @players.each do |player|
        player.cards << pick!
      end
    end
  end

  def pick!
    @cards.pop
  end
end

class Player
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end
end

_player1 = Player.new
_player2 = Player.new


class CardSet
  attr_reader :cards
  include Comparable
  def initialize(*cards)
    @cards = cards
  end

  def <=>(other)
    @cards.first <=> other.cards.first
  end
end
