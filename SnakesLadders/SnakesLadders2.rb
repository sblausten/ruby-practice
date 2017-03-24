require 'test/unit/ui/console/testrunner'


class SnakesLadders
  # Write your magic here!
  def initialize
    @@player1 = 0
    @@player2 = 0
    @@player_turn = 0
  end
  
  def turnSwitch 
    if @@player_turn == 0
      @@player_turn = 1
    elsif @@player_turn == 1
      @@player_turn = 0
    end
  end
  
  def play(x, y)
    positionStart
    move(x, y)
    snakeOrLadder
    checkWin
    positionEnd
    result
    #check for double roll
    unless x == y
      #puts "Player #{@@player_turn} rolled a double so has got another go!" 
      turnSwitch
    end
  end
  
  def positionStart 
    if @@player_turn == 0
      @@position = @@player1
    elsif @@player_turn == 1
      @@position = @@player2
    end
  end

  def move(a, b)
    move = a + b
    @@position += move
  end

  def snakeOrLadder

    #Ladders
    case @@position
    when 2
      @@position = 38
      
    when 7
      @@position = 14
      
      
    when 8
      @@position = 31
      
      
    when 15
      @@position = 26
      
      
    when 21
      @@position = 42
      
      
    when 28
      @@position = 84
      
      
    when 36
      @@position = 44
      
      
    when 51
      @@position = 67
      
      
    when 71
      @@position = 91
      
      
    when 78
      @@position = 98
      
      
    when 87
      @@position = 94
      
      
    end

    #Snakes
    case @@position
    when 16
      @@position = 6
      
      @@snake = true
    when 46
      @@position = 25
      
      @@snake = true
    when 49
      @@position = 11
      
      @@snake = true
    when 62
      @@position = 19
      
      @@snake = true
    when 64
      @@position = 58
      
      @@snake = true
    when 74
      @@position = 53
      
      @@snake = true
    when 89
      @@position = 68
      
      @@snake = true
    when 92
      @@position = 88
      
      @@snake = true
    when 95
      @@position = 75
      
      @@snake = true
    when 99
      @@position = 78
      
      @@snake = true
    end
  end 
  
  def checkWin
    if @@position > 100
      @@movespaces = -(@@position %= 100)
      @position += @@moveSpaces
      puts "Player #{@@turn} bounced back #{@@moveSpaces} spaces because they didn't hit 100 exactly."
    elsif @@position == 100
      puts "Player #{@@turn} won! Thank you for playing."
      exit
    end
  end

  def positionEnd
    if @@player_turn == 0
      @@player1 = @@position
    elsif @@player_turn == 1
     @@player2 =  @@position
    end
  end
  
  def result
    if @@player_turn == 0
        #set variables for result readout
        puts "Player 1 is on square #{@@player1}"
    elsif @@player_turn == 1
        #set variables for result readout
        puts "Player 2 is on square #{@@player2}"
    end
    
  end
end

game = SnakesLadders.new
game.play(1, 1)
game.play(1, 5)
game.play(6, 2)
game.play(1, 1)

