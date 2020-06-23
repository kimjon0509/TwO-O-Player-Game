require "./question"

class Game
  attr_accessor :winner, :curr_player, :player1, :player2

  def initialize(player1, player2)
    self.player1 = player1
    self.player2 = player2
    self.curr_player = nil
    self.winner = nil
  end

  def get_winner
    if self.player1.health == 0
      self.winner = self.player2
    elsif self.player2.health == 0
      self.winner = self.player2
    end
  end

  def switch_player
    if self.curr_player == player1
      self.curr_player = player2
    elsif self.curr_player == player2
      self.curr_player = player1
    end
  end

  def do_turn
    q = Question.new
    player = self.curr_player
    puts q.prompt(player.name)
    if q.answer_correct?(gets.to_i)
      puts "#{player.name}: YES! You are correct."
    else
      puts "#{player.name}: Seriously? No!"
      player.reduce_player_health
    end
  end

  def score_board
    puts "P1: #{self.player1.health}/3 vs P2: #{self.player2.health}/3"
  end

  def run
    self.curr_player = player1
    while !winner
      self.do_turn
      self.switch_player
      self.get_winner
      self.score_board
      puts "--------NEW TURN----------"
    end
    puts "#{self.winner.name} wins with a score of #{self.winner.health}/3"
    puts "--------GAME OVER----------"
    puts "Good Bye!"
  end

end
