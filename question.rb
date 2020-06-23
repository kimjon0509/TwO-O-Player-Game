class Question 

  def initialize
    @val1, @val2  = rand(1..20), rand(1..20)
  end

  def answer_correct?(answer)
    return answer == @val1 + @val2
  end

  def prompt(player)
    return "#{player}: What does #{@val1} plus #{@val2} equal?"
  end
  
end