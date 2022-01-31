class Question

  @@number_of_questions = 0

  attr_reader :correct_answer
  
  def initialize
    @@number_of_questions += 1
    @id = @@number_of_questions
  end

  def new_question
    @first_num = rand(1..20)
    @second_num = rand(1..20)
    @string_operator = random_operator()

    if @string_operator == "plus"
      @correct_answer = @first_num + @second_num
    elsif @string_operator == "minus"
      @correct_answer = @first_num - @second_num
    elsif @string_operator == "multiplied by"
      @correct_answer = @first_num * @second_num
    end

    "What is #{@first_num} #{@string_operator} #{@second_num}?"
  end

  def random_operator
    operators_array = ["plus", "minus", "multiplied by"]
    operators_array[rand(0..2)]
  end

end

q1 = Question.new()
p q1
p q1.new_question
p q1.correct_answer