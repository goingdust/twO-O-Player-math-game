require './question'
require './turn'

class Round

  attr_reader :results

  def initialize(players)
    @players = players
    @question = Question.new()
    player_turns()
  end

  def player_turns
    @results = @players.map do |player|
      @score_string = ""
      result = Turn.new(@players.index(player) + 1, @question).result
      
      if !result
        player[:"#{@players.index(player) + 1}"].take_a_life
      end
      
      @players.each do |player|
        index = @players.index(player)
        player_obj = player[:"#{@players.index(player) + 1}"]

        if index == @players.length - 1
          @score_string += "P#{index + 1}: #{player_obj.lives}/3"
        else
          @score_string += "P#{index + 1}: #{player_obj.lives}/3 vs "
        end
      end
      puts @score_string
    end
  end

end