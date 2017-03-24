## Project based on CodeWars Kata with a bit of extended scope! https://www.codewars.com/kata/snakes-and-ladders-1
# This is the main class for game with all logic and objects

class SnakesLadders
  def initialize
    puts "Welcome to Snakes and Ladders!"
    playerNumber
    turnPrompt
  end

  def playerNumber
    puts "How many people are playing?"
    @@n = gets.chomp.to_i
    while (@@n.is_a? String) || (@@n < 1)
      puts "Please enter a number of players"
      @@n = gets.chomp.to_i
    end
    createPlayers
  end

  #Actually creates player positions in array with starting position of 0
  def createPlayers
    @@playerArray = Array.new(@@n, 0)
    puts "Players = #{@@playerArray}"
    #sets player turn to Player 1 for first turn
    @@playerTurn = 0
  end 
  
  #Adds some interactivity for players and allows them to quit
  def turnPrompt
  	@@turn = @@playerTurn + 1
    puts "\nIt is Player #{@@turn}\'s turn."
    puts "Type \"r\" to roll your dice!"
    puts "Type \"e\" to exit."
    @command = gets.downcase.chomp
    turnAction(@command)
        puts "----PlayerTurn at end turnPrompt is #{@@playerTurn}\n Turn is #{@@turn}"

  end
  
  #Model for turn action - rolls dice, moves player
  def turnAction(command)   
    if command == "r"
      diceRoll
      puts "Player #{@@turn} rolled a #{@@die1} and #{@@die2}."
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
    @position = @@playerArray[@@playerTurn] + @@moveSpaces
   	#Check for bounce on end of board or a win
   	if @position > 100
   		@@movespaces = -(@position % 100)
   		@position += @@moveSpaces
   		puts "Player #{@@turn} bounced back #{@@moveSpaces} spaces because they didn't hit 100 exactly."
   	elsif @position == 100
   		puts "Player #{@@turn} won! Thank you for playing."
   		exit
   	end

   	#check if they hit a Snake or Ladder
   	snakeOrLadder(@position)
 		unless @@ladder || @@snake 
      #update the actual array value if it hasn't been updated already through SnakeOrLadder
      @@playerArray[@@playerTurn] = @position
 			puts "Player #{@@turn} is now on space #{@@playerArray[@@playerTurn]}"
 		end

 		#check for double roll
   	if @@die1 == @@die2 
   		puts "Player #{@@turn} rolled a double so has got another go!" 
   	else 
   		playerSwitch 
   	end
  end

  def snakeOrLadder(position)
  	@@ladder = false
  	@@snake = false
  	#passes player position to the case switch so that we don't need to copy out for each player
  	endPosition = position

    #Ladders
  	case endPosition 
  	when 2
  		endPosition = 38
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
  	when 7
  		endPosition = 14
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
  	when 8
  		endPosition = 31
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
	  when 15
  		endPosition = 26
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
  	when 21
  		endPosition = 42
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
  	when 28
  		endPosition = 84
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
  	when 36
  		endPosition = 44
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
  	when 51
  		endPosition = 67
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
  	when 71
  		endPosition = 91
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
  	when 78
  		endPosition = 98
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
  	when 87
  		endPosition = 94
  		@@ladder =true
  		puts "Player #{@@turn} landed on a Ladder and moved up to square #{endPosition}"
  	end

    #Snakes
  	case endPosition
  	when 16
  		endPosition = 6
  		@@snake = true
  		puts "Player #{@@turn} landed on a snake and moved back to square #{endPosition}"
  	when 46
  		endPosition = 25
  		@@snake = true
  		puts "Player #{@@turn} landed on a snake and moved back to square #{endPosition}" 		
  	when 49
  		endPosition = 11
  		@@snake = true
  		puts "Player #{@@turn} landed on a snake and moved back to square #{endPosition}"
  	when 62
  		endPosition = 19
  		@@snake = true
  		puts "Player #{@@turn} landed on a snake and moved back to square #{endPosition}"
  	when 64
  		endPosition = 58
  		@@snake = true
  		puts "Player #{@@turn} landed on a snake and moved back to square #{endPosition}"
  	when 74
  		endPosition = 53
  		@@snake = true
  		puts "Player #{@@turn} landed on a snake and moved back to square #{endPosition}"
  	when 89
  		endPosition = 68
  		@@snake = true
  		puts "Player #{@@turn} landed on a snake and moved back to square #{endPosition}"
  	when 92
  		endPosition = 88
  		@@snake = true
  		puts "Player #{@@turn} landed on a snake and moved back to square #{endPosition}"
  	when 95
  		endPosition = 75
  		@@snake = true
  		puts "Player #{@@turn} landed on a snake and moved back to square #{endPosition}"
  	when 99
  		endPosition = 78
  		@@snake = true
  		puts "Player #{@@turn} landed on a snake and moved back to square #{endPosition}"
  	end

  	#update player positions in array
  	@@playerArray[@@playerTurn] = endPosition
  end	
  
  def playerSwitch
    #moves turn to next player
    if @@turn < @@n
    	@@playerTurn += 1
    #re-starts player round
    elsif @@turn == @@n
    	@@playerTurn = 0
      winningPlayer = @@playerArray.sort.reverse
      @@playerArray.each {|n| puts "Player #{@@playerArray.index(n)} is winning!" if n == winningPlayer[0]} 
    else
    	puts "Error with player turns. We've reset it to Player 1."
    	@@playerTurn = 0
    end
  end

end

SnakesLadders.new

