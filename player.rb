class Player name

  attr_accessor :name, :life
  MAX_LIFE = 3

  def initialize(name)
    @name = name
    @life = MAX_LIFE
  end

  def summary
    "Player #{@name}: #{@life}/#{MAX_LIFE}"
  end

  def dead?
    @life < 1
  end

  def wrong_answer
    @life -= 1
  end

end