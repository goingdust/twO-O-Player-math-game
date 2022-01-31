class Player

  @@number_of_players = 0

  attr_reader :id, :lives

  def initialize
    @@number_of_players += 1
    @id = @@number_of_players
    @lives = 3
  end

  def take_a_life
    @lives -= 1
  end
end