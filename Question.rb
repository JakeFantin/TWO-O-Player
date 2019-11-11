# frozen_string_literal: true

class Question
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = (@num1 + @num2).to_s
  end

  def ask_question
    "What does #{@num1} plus #{@num2} equal?"
  end

  def check_answer(num)
    @answer === num
  end
end
