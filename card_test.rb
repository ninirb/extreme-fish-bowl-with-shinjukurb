require 'minitest/autorun'
require './card'

class CardTest < Minitest::Test
  def test_card
    assert (Card.new(2, 'heart') > Card.new(3, 'diamond'))

    assert (Card.new(4, 'heart') > Card.new(3, 'diamond'))

    assert (Card.new(1, 'heart').suit == Card.new(3, 'heart').suit)
    refute (Card.new(1, 'diamond').suit == Card.new(3, 'heart').suit)
  end
end

class DeckTest < Minitest::Test
  def test_deck
    assert (Deck.new.cards.length == 52)
    deck = Deck.new
    deck.pick!
    assert deck.cards.length == 51
  end
end

class CardSetTest < Minitest::Test
  def test_card_set
    assert CardSet.new(Card.new(2, "heart"), Card.new(2, "diamond")) > CardSet.new(Card.new(3, "heart"), Card.new(3, "diamond"))
  end
end
