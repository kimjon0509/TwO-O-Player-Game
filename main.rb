require './player'
require './game'
require './question'

player1 = Player.new(1)
player2 = Player.new(2)
question = Question.new

game = Game.new(player1, player2)
game.run