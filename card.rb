class Card
  include Comparable
  attr_reader :number, :power
  attr_reader :suit

  def initialize(number, suit)
    @number = number
    @suit = suit
    @power = [2, 1, *(13..3)]
  end

  def <=>(other)
    @power - other.power
  end
end

raise unless (Card.new(2, 'heart') > Card.new(3, 'diamond'))
raise unless (Card.new(4, 'heart') > Card.new(3, 'diamond'))

raise unless (Card.new(1, 'heart').mark == Card.new(3, 'heart').mark)
raise if (Card.new(1, 'diamond').mark == Card.new(3, 'heart').mark)








