class Questions

  def get_random_number
    (rand() * 10).to_i
  end

  def new_question
    @number1 = get_random_number
    @number2 = get_random_number
    @answer = @number1 + @number2
    "What does #{@number1} plus #{@number2} equal?"
  end

  def answer_correct? answer
    answer == @answer
  end

end
