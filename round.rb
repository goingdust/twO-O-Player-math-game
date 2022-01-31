require './question'
require './turn'

class Round

  attr_reader :results

  def initialize(num_of_players)
    @num_of_players_array = [*1..num_of_players]
    @question = Question.new()
    play_a_round()
  end

  def play_a_round
    @results = @num_of_players_array.map do |player|
      Turn.new(@num_of_players_array.index(player) + 1, @question).result
    end
  end

end

r1 = Round.new(3)