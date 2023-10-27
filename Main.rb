require_relative 'Player'
require_relative 'Question'
require_relative 'Game'
require_relative 'UserInterface'

player1 = Player.new("Player 1")
player2 = Player.new("Player 2")
game = Game.new(player1, player2)

puts "Welcome to the Math Game!"

until game.game_over?
  current_player = game.players[game.current_player_index]
  question = Question.new

  UserInterface.display_message("#{current_player.name}, your question:")
  UserInterface.display_message(question.question)
  user_answer = UserInterface.get_user_answer

  if question.check_answer(user_answer)
    UserInterface.display_message("Correct! Well done, #{current_player.name}.")
  else
    UserInterface.display_message("Wrong answer, #{current_player.name}. The correct answer was #{question.answer}.")
    current_player.lose_life
    UserInterface.display_message("Scoreboard:")
    UserInterface.display_message("#{player1.name}: #{player1.lives} lives")
    UserInterface.display_message("#{player2.name}: #{player2.lives} lives")
  end

  UserInterface.display_message("----- New Turn -----")
  game.switch_player
end

winner = game.players.find { |player| player.lives > 0 }
UserInterface.display_message("Game Over! #{winner.name} wins with #{winner.lives} lives left.")
