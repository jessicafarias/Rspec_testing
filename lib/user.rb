class User
  attr_reader :symb, :name
  def initialize(symb, name)
    @name = name
    @symb = symb
  end
end
