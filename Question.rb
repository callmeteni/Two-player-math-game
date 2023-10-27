class Question
    attr_accessor :question, :answer
  
    def initialize
      generate_question
    end
  
    def generate_question
      num1 = rand(1..20)
      num2 = rand(1..20)
      operator = ['+', '-', '*', '/'].sample
      @question = "What is #{num1} #{operator} #{num2}?"
      @answer = eval("#{num1} #{operator} #{num2}")
    end
  
    def check_answer(user_answer)
      user_answer.to_i == @answer
    end
  end