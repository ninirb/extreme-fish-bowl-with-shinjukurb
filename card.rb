class Card
  include Comparable
  attr_reader :number

  def initialize(number, mark)
    # 歴史的経緯により文字列がくる
    @number = number.to_i
    # 歴史的経緯によりmark
    @mark = mark
  end

  def <=>(other)
    other.number - @number
  end
end

raise unless (Card.new('2') > Card.new('3'))
