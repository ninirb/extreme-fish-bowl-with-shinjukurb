
    assert (Deck.new.cards.length == 52)
    deck = Deck.new
    deck.pick!
    assert deck.cards.length == 51

