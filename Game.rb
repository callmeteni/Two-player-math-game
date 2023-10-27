class Game
    attr_accessor :players
  
    def initialize(player1, player2)
      @players = [player1, player2]
      @current_player_index = 0
    end
  
    def switch_player
      @current_player_index = (@current_player_index + 1) % 2
    end
  
    def game_over?
      @players.any? { |player| player.lives <= 0 }
    end
  end
  