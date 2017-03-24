#Main class for game with all logic and objects

class SnakesLadders
  def initialize
    puts "Welcome to Snakes and Ladders!"
    createPlayers
    turnPrompt
  end
   
  #Players as class variables with starting position of 0
  def createPlayers
    @@player1 = 0
    @@player2 = 0
    @@playerTurn = 0
  end 
  
  #Adds some interactivity for players and allows them to quit
  def turnPrompt
  	turn = @@playerTurn 
    puts "\nIt is Player #{turn += 1}\'s turn."
    puts "Type \"r\" to roll your dice!"
    puts "Type \"e\" to exit."
    @command = gets.downcase.chomp
    turnAction(@command)
  end
  
  #Model for turn action - rolls dice, moves player, switches player
  def turnAction(command)   
    if command == "r"
      #needs to be a Lambda so it continues through rest of code
      diceRoll
      puts "You rolled a #{@@die1} and #{@@die2}."
      play
      move
      turnPrompt
    elsif command == "e"
      exit
    else 
      turnPrompt
    end
  end
    
  def diceRoll
    @@die1 = Random.rand(1..6)
    @@die2 = Random.rand(1..6)
  end
  
  def play
    @@moveSpaces = (@@die1 + @@die2)    
  end

  def move
  	turn = @@playerTurn 
  	case @@playerTurn
	   when 0
	   	@@player1 += @@moveSpaces
	   	#Check for bounce on end of board or a win
	   	if @@player1 > 100
	   		@@movespaces = -(@@player1 % 100)
	   		@@player1 += @@moveSpaces
	   		puts "Player 1 bounced back #{@@moveSpaces} spaces because they didn't hit 100 exactly."
	   	elsif @@player1 == 100
	   		puts "Player 1 won! Thank you for playing."
	   		exit
	   	end
	   	#check if they hit a Snake or Ladder
	   	snakeOrLadder
	   		unless @@ladder || @@snake 
	   			puts "Player #{turn += 1} is now on space #{@@player1}"
	   		end
	   		#check for double roll
		   	if @@die1 == @@die2 
		   		puts "You rolled a double so you've got another go!" 
		   	else 
		   		playerSwitch 
		   	end
	   when 1
	   	@@player2 += @@moveSpaces
	   	#Check for bounce on end of board or a win
	   	if @@player2 > 100
	   		@@movespaces = -(@@player2 % 100)
	   		@@player2 += @@moveSpaces
	   		puts "Player 2 bounced back #{@@moveSpaces} because they didn't hit 100 exactly."
	   	elsif @@player2 == 100
	   		puts "Player 2 won! Thank you for playing."
	   		exit
	   	end
	   	#check if they hit a Snake or Ladder
	   	snakeOrLadder
	   		unless @@ladder || @@snake
	   			puts "Player #{turn += 1} is now on space #{@@player2}"
	   		end
	   		#check for double roll
		   	if @@die1 == @@die2 
		   		puts "You rolled a double so you've got another go!" 
		   	else 
		   		playerSwitch 
		   	end
	   else 
	   	puts "player turn error"
   	end
  end

  def snakeOrLadder
  	@@ladder = false
  	@@snake = false

  	#passes player turn to the case switch so that we don't need to copy out for each player
  	if @@playerTurn == 0
  		endPosition = @@player1
  	elsif @@playerTurn == 1
  		endPosition = @@player2
  	end

#Ladders
  	case endPosition 
  	when 2
  		endPosition = 38
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
  	when 7
  		endPosition = 14
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
  	when 8
  		endPosition = 31
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
	when 15
  		endPosition = 26
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
  	when 21
  		endPosition = 42
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
  	when 28
  		endPosition = 84
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
  	when 36
  		endPosition = 44
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
  	when 51
  		endPosition = 67
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
  	when 71
  		endPosition = 91
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
  	when 78
  		endPosition = 98
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
  	when 87
  		endPosition = 94
  		@@ladder =true
  		puts "You landed on a Ladder and moved up to square #{endPosition}"
  	end

#Snakes
  	case endPosition
  	when 16
  		endPosition = 6
  		@@snake = true
  		puts "You landed on a snake and moved back to square #{endPosition}"
  	when 46
  		endPosition = 25
  		@@snake = true
  		puts "You landed on a snake and moved back to square #{endPosition}" 		
  	when 49
  		endPosition = 11
  		@@snake = true
  		puts "You landed on a snake and moved back to square #{endPosition}"
  	when 62
  		endPosition = 19
  		@@snake = true
  		puts "You landed on a snake and moved back to square #{endPosition}"
  	when 64
  		endPosition = 58
  		@@snake = true
  		puts "You landed on a snake and moved back to square #{endPosition}"
  	when 74
  		endPosition = 53
  		@@snake = true
  		puts "You landed on a snake and moved back to square #{endPosition}"
  	when 89
  		endPosition = 68
  		@@snake = true
  		puts "You landed on a snake and moved back to square #{endPosition}"
  	when 92
  		endPosition = 88
  		@@snake = true
  		puts "You landed on a snake and moved back to square #{endPosition}"
  	when 95
  		endPosition = 75
  		@@snake = true
  		puts "You landed on a snake and moved back to square #{endPosition}"
  	when 99
  		endPosition = 78
  		@@snake = true
  		puts "You landed on a snake and moved back to square #{endPosition}"
  	end

  	#update player positions
  	if @@playerTurn == 0
  		@@player1 = endPosition
  	elsif @@playerTurn == 1
  		@@player2 = endPosition
  	end

  end	
  
  def playerSwitch
    if @@playerTurn == 0
    	@@playerTurn = 1
    elsif @@playerTurn == 1
    	@@playerTurn = 0
    else
    	puts "Error with player turns. We've reset it to Player 1."
    	@@playerTurn = 0
    end
  end

end

SnakesLadders.new

