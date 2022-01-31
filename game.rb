require './round'
require './player'

class Game

  def initialize(num_of_players)
    @num_of_players = num_of_players
    @players = [*1..num_of_players].map { |player_id| { "#{player_id}": new_player() } }
    play_game()
  end

  def new_player
    Player.new()
  end

  def play_a_round
    Round.new(@players)
    @players.each do |player|
      index = @players.index(player)
      if player[:"#{index + 1}"].lives == 0
        @loser = index + 1
      end
    end
  end

  def announce_results
    puts "Aww... Player #{@loser} has died."
    puts "----- GAME OVER -----"
    puts "G'bye!"
  end

  def play_game
    
    while @players.select { |player| player[:"#{@players.index(player) + 1}"].lives <= 0 }.length <= 0
      play_a_round()
    end

    announce_results()
  end

end

Game.new(3)