class Turn

  def initialize(player_id, question)
    @player_id = player_id
    @question_prompt = question.question_prompt
    @correct_answer = "#{question.correct_answer}"
  end

  def ask_question
    puts "----- NEW TURN -----"
    puts "Player #{@player_id}: #{@question_prompt}"
    @player_response = gets.chomp
    if @player_response == @correct_answer
      puts "YES! You are correct."
      true
    else
      puts "Seriously? No!"
      false
    end
  end

end