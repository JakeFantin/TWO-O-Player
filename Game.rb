require_relative "Question"
require_relative "Player"

class Game
  def initialize
    @players = [Player.new(1), Player.new(2)]
    @active_player = @players[0]
  end

  def start
    numbers = "0123456789"
    puts "----- NEW GAME -----"
    while @players[0].life > 0 && @players[1].life > 0 do
      question = Question.new
      puts "\n----- NEW TURN -----\n"
      puts "#{@active_player.name}: #{question.getQuestion}"
      print "> "
      input = $stdin.gets.chomp
      if input === "exit"
        exit(0)
      end
      if question.getAnswer input
        puts "#{@active_player.name}: YES! You are correct."
      else
        puts "#{@active_player.name}: Seriously? No!"
        @active_player.loss
      end
      puts "P1: #{@players[0].score} vs P2: #{@players[1].score}"
      switchPlayer
    end
    winner = @players[0].life ? @players[0] : @players[1]
    puts "#{winner.name} wins with a score of #{winner.score}"
    puts "----- GAME OVER -----"
    puts "Good Bye!"
    exit(0)
  end

  def switchPlayer
    if @active_player === @players[0]
      @active_player = @players[1]
    else
      @active_player = @players[0]
    end
  end

end