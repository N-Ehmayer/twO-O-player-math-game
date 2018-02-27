class State
  attr_accessor :players, :current_player, :game_playing, :game, :player_answer

  def initialize
    @players = ['1', '2']
    @current_player = '1'
    @game = Game.new
    @game_playing = true
    while @game_playing do
      play_turn
    end
  end

  def play_turn
    puts "Player #{current_player}: #{game.question}"
    print "> "
    @player_answer = gets.chomp.to_i
    if correct_answer?
      puts "Correct!"
    else
      puts "What? No..."
      @game.minus_life(@current_player)
    end
    display_score
    puts "----- NEW TURN -----"
    switch_player
    check_win
  end

  def correct_answer?
    @game.current_answer == player_answer
  end

  def switch_player
    @current_player = @current_player == '1' ? '2' : '1'
  end

  def display_score
    puts "P1: #{@game.player1_lives}/3 vs P2: #{@game.player2_lives}/3"
  end

  def check_win
    if @game.player1_lives == 0 || @game.player2_lives == 0
      if @game.player1_lives == 0
        puts "Player #{@players[1]} wins with a score of #{@game.player2_lives}/3!"
      elsif @game.player2_lives == 0
        puts "Player #{@players[0]} wins with a score of #{@game.player1_lives}/3!"
      end
      puts "----- GAME OVER -----"
      puts "Good bye!"
      @game_playing = false
    end
  end

end

