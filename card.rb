class Card
  include Comparable
  attr_reader :number
  attr_reader :mark

  def initialize(number, mark)
    # 歴史的経緯により文字列がくる
    @number = number.to_i
    # 歴史的経緯によりmark
    @mark = mark
  end

  def <=>(other)
    (1..13).
    other.number - @number
  end
end

raise unless (Card.new('2', 'heart') > Card.new('3', 'diamond'))

raise unless (Card.new('1', 'heart').mark == Card.new('3', 'heart').mark)
raise if (Card.new('1', 'diamond').mark == Card.new('3', 'heart').mark)
