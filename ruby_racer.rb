require_relative 'die'
class RubyRacer
  attr_reader :players, :die, :length

  def initialize(players, die, length = 30)
    @players = players
    @Die = die
    @length = length
    @player_1= Array.new(@length){"|"}.insert(0,"x")
    @player_2 = Array.new(@length){"|"}.insert(0,"x")
    @finished = false
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    @finished == true
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    if finished?
      if @player_1[@length] = "x"
        return @players[0]
      elsif @player_2[@length] = "x"
        return @players[1]
      end
    end

  end

  # Rolls the die and advances +player+ accordingly
  def advance_player(player)
    if player == @players[0]
      @player_1.insert(@player_1.index("x") + @Die.roll, "x")
      @player_1.delete_at(@player_1.index("x") || @player_1.length)
      if @player_1.index("x") == @length + 1
          @finished = true
      end
    elsif player == @players[1]
     @player_2.insert(@player_2.index("x") + @Die.roll, "x")
     @player_2.delete_at(@player_2.index("x") || @player_2.length)
      if @player_2.index("x") == @length + 1
        @finished = true
      end
    end
   end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization
    puts @player_1.join
    puts @player_2.join
  end
end
