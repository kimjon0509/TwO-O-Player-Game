class Player
  attr_reader :health, :name

  def initialize(num)
    @name = "Player #{num}"
    @health = 3 
  end

  def reduce_player_health
    @health -= 1 
  end

end
