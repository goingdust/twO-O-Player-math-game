require './question'
require './turn'

class Round

  def initialize(players)
    @players = players
    @question = Question.new()
    play_a_round()
  end

  def play_a_round
    @players.map do |player|
      @score_string = ""
      result = Turn.new(@players.index(player) + 1, @question).ask_question
      
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