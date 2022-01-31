class Turn

  attr_reader :result

  def initialize(player_id, question)
    @player_id = player_id
    @question_prompt = question.question_prompt
    @correct_answer = "#{question.correct_answer}"
    ask_question()
  end

  def ask_question
    puts "----- NEW TURN -----"
    puts "Player #{@player_id}: #{@question_prompt}"
    @player_response = gets.chomp
    if @player_response == @correct_answer
      @result = true
      puts "YES! You are correct."
    else
      @result = false
      puts "Seriously? No!"
    end

  end

end