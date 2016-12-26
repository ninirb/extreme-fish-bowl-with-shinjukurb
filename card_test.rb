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
  def test_pick
    assert (Deck.new(Player.new).cards.length == 52)
    deck = Deck.new(Player.new)
    deck.pick!
    assert deck.cards.length == 51
  end
  def test_distribute
    p1 = Player.new
    p2 = Player.new
    deck = Deck.new(p1, p2)
    deck.distribute

    assert p1.cards.size == 26
  end
end

class CardSetTest < Minitest::Test
  def test_card_set
    assert CardSet.new(Card.new(2, "heart"), Card.new(2, "diamond")) > CardSet.new(Card.new(3, "heart"), Card.new(3, "diamond"))
  end
end
