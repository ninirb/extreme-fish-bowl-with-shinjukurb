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

  def initialize(*players)
    @cards = SUITS.map do |suit|
      (1..13).map { |num| Card.new(num, suit) } end.flatten
    @players = players
  end

  def shuffle
    @cards.shuffle
  end

  def distribute
    loop do
      @players.each do |player|
        return if @cards.empty?
        player.draw(pick!)
      end
    end
  end

  def pick!
    @cards.pop
  end

  def first_player
    @players.find do |player|
      player.cards.find {|c| c.suit == 'diamond' && c.number == 3 }
    end
  end
end

class Player
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def draw(card)
    @cards << card
  end
end

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
