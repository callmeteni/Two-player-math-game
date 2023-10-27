class UserInterface
    def self.get_user_answer
      print "Your answer: "
      gets.chomp.to_i
    end
  
    def self.display_message(message)
      puts message
    end
  end
  