class Round
  attr_accessor :player, :round

  def initialize player, round
    @player = player
    @round = round
  end

  def switch_player player
    @player = player
  end
  def increment_turn
    @round+=1
  end

  def next_round player
    switch_player player
    increment_turn
  end

end
