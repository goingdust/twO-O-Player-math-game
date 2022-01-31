require './question'

class Turn
  def initialize(id)
    @id = id
  end

  def ask_question
    "#{@question_prompt}"
    player_answer = gets.chomp
    if player_answer == @correct_answer
      "YES! You are correct."
    else
      "Seriously? No!"
    end
  end
end