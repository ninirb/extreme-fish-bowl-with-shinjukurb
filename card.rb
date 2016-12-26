class Card
  include Comparable
  attr_reader :number, :power
  attr_reader :mark

  def initialize(number, mark)
    # 歴史的経緯により文字列がくる
    @number = number.to_i
    # 歴史的経緯によりmark
    @mark = mark
    @power = case @number
    when 1,2
      @number + 13
    else
      @number
    end
  end

  def <=>(other)
    other.power - @power
  end
end

class Deck
end

raise unless (Card.new('2', 'heart') > Card.new('3', 'diamond'))
raise unless (Card.new('4', 'heart') > Card.new('3', 'diamond'))

raise unless (Card.new('1', 'heart').mark == Card.new('3', 'heart').mark)
raise if (Card.new('1', 'diamond').mark == Card.new('3', 'heart').mark)








