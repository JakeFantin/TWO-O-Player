class Player
  attr_accessor :name, :life
  def initialize(name)
    @name = "Player #{name}"
    @life = 3
  end

  def score
    return "#{life}/3"
  end

  def loss
    @life -= 1;
  end
end