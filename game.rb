class Game

  attr_accessor :lives, :player1_lives, :player2_lives, :current_n1, :current_n2, :current_answer

  def initialize
    @player1_lives = 3
    @player2_lives = 3
  end

  def question
    @current_n1 = rand(20)
    @current_n2 = rand(20)
    @current_answer = @current_n1 + @current_n2
    return "What does #{@current_n1} + #{@current_n2} equal?"
  end

  def minus_life(player)
    if player == '1'
      @player1_lives -= 1
    else
      @player2_lives -=1
    end
  end

end