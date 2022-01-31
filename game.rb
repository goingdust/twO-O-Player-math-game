require './round'
require './player'

class Game

  def initialize(num_of_players)
    @num_of_players = num_of_players.to_i
    @players = [*1..@num_of_players].map { |player_id| { "#{player_id}": new_player() } }
  end

  def new_player
    Player.new()
  end

  def get_loser
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
    puts "BEEP BOOP now starting up the game .... here we go!!"

    while @players.select { |player| player[:"#{@players.index(player) + 1}"].lives <= 0 }.length <= 0
      Round.new(@players)
      get_loser()
    end
    announce_results()
  end

end