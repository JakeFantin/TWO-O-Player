class Question

  def initialize()
    @num1 = rand(20) + 1
    @num2 = rand(20) + 1
    @answer = (@num1 + @num2).to_s
  end
  
  def getQuestion
    return "What does #{@num1} plus #{@num2} equal?"
  end

  def getAnswer (num)
    @answer === num
  end

end
