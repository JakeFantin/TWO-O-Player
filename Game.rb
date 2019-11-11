# frozen_string_literal: true

require_relative 'Question'
require_relative 'Player'

class Game
  def initialize
    @players = [Player.new(1), Player.new(2)]
    @active_player = @players[0]
  end

  def start
    puts '----- NEW GAME -----'
    while @players[0].life.positive? && @players[1].life.positive?
      question = Question.new
      puts "\n----- NEW TURN -----\n"
      puts "#{@active_player.name}: #{question.ask_question}"
      print '> '
      input = $stdin.gets.chomp
      exit(0) if input === 'exit'
      if question.check_answer input
        puts "#{@active_player.name}: YES! You are correct."
      else
        puts "#{@active_player.name}: Seriously? No!"
        @active_player.loss
      end
      puts "P1: #{@players[0].score} vs P2: #{@players[1].score}"
      switch_player
    end
    winner = @players[0].life ? @players[0] : @players[1]
    puts "#{winner.name} wins with a score of #{winner.score}"
    puts '----- GAME OVER -----'
    puts 'Good Bye!'
    exit(0)
  end

  def switch_player
    @active_player = if @active_player === @players[0]
                       @players[1]
                     else
                       @players[0]
                     end
  end
end
