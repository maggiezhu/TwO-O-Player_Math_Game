require_relative './player'
require_relative './question_generator'
require 'pry'

class Game

  def initialize

    @players = [
      Player.new('player1'),
      Player.new('player2')
    ]
    @current_player = @players[0]
    @current_round = 1
    @question = Questions.new

  end

  def play

    while !game_over?
      puts '========= New Turn ======='
      puts "#{@current_player.name} please answer Question:"
      puts @question.new_question
      @answer = gets.chomp.to_i
      puts @answer.inspect

      if @question.answer_correct?(@answer)
        puts 'Correct!'
        # call next round function to change current player,
        next_round
      else
        @current_player.wrong_answer
        puts 'Oh no! Wrong answer!'
        next_round
      end

      #print around summary
      @players.each do |player|
        puts player.summary
      end
    end

    puts "Game Over! #{winner_player.summary} Win!!!"
  end

  def next_round
    puts @current_player
    @current_player = @players.select{|player| player != @current_player}[0]
    puts @current_player
    @current_round += 1
  end

  def game_over?
    @players.each do |player|
      if player.dead?
        return true
      end
    end
    return false
  end

  def winner_player
    @players.select{|player| player.life >= 1}[0]
  end

end


