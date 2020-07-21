require 'colorize'

class Board
  attr_reader :symb, :counter, :b, :symbols

  def initialize
    @b = Array.new(3) { |i| Array.new(3) { |j| ((i * 3 + j + 1)).to_s.blue } }
    @counter = 9
    @symb = ''
    @symbols = %w[X O]
  end

  def turn(symb, loc)
    return false if invalid_input(loc)

    update_board(loc, symb)

    if winner(@b)
      @counter = 0
      @symb = symb
    else
      @counter -= 1
    end

    true
  end

  def current
    (@counter + 1) % 2
  end

  def display
    b.map { |i| i.join('|') }
  end

  #  private

  def winner(test)
    trans = test.transpose
    (0...test.size).collect { |i| test[i][i] }.uniq.count == 1 ||
      (0...test.size).collect { |i| test[test.size - i - 1][i] }.uniq.count == 1 ||
      test.map { |x| x.uniq.count }.include?(1) ||
      trans.map { |x| x.uniq.count }.include?(1)
  end

  def invalid_input(loc)
    !loc.to_s.match?(/[1-9]/) || loc.to_s.length != 1 || @b[(loc - 1) / 3][(loc - 1) % 3].match?(/[XO]/)
  end

  def update_board(loc, symb)
    @b[(loc - 1) / 3][(loc - 1) % 3] = symb
  end
end
