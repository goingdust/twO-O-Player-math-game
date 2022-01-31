require './question'
require './player'
# require './turn'

class Game

  def initialize(num_of_players)
    @num_of_players = num_of_players
    @players = [*1..num_of_players].map { |player_id| { "#{player_id}": new_player() } }
    p @players.select { |player| player[:"#{@players.index(player) + 1}"].lives <= 0 }.length <= 0
  end

  

  def new_player
    Player.new()
  end

  # while @players.select { |player| player[:"#{@players.index(player) + 1}"].lives <= 0 }.length <= 0

  # end

  def new_round
    @results = Round.new(@num_of_players)
  end

end

# q1 = Question.new()
# p q1
# p q1.question_prompt
# p q1.correct_answer

Game.new(5)