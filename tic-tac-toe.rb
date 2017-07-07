
X = """
xx   xx
xx xx
xxx
xx xx
xx   xx"""

X = X[1..-1]

O = """
ooo
oo oo
oo   oo
oo oo
ooo"""
   
   
O = O[1..-1]

number = """
 
 
%d
 
 """
number = number[1..-1]



osplit = O.split("\n")

xsplit = X.split("\n")

i = 0 
puts "\n"
boardArray = Array.new(9,0)
$score = [0, 0]

def printboard(gameArray, osplit, xsplit, number) 
  
  for i in (0..4) do 

    printRow(gameArray, 1, xsplit, osplit, number, i )
    
    print "#"
    printRow(gameArray, 2, xsplit, osplit, number, i )
    
    print "#"
    printRow(gameArray, 3, xsplit, osplit, number, i )
    
    print "\n"
    
    
  end
  print "         #         #\n"
  print "#" * 29
  print "\n         #         #\n"
  
  for i in (0..4) do 
    
    printRow(gameArray, 4, xsplit, osplit, number, i )
    
    print "#"
    printRow(gameArray, 5, xsplit, osplit, number, i )
    
    print "#"
    printRow(gameArray, 6, xsplit, osplit, number, i )
    
    print "\n"
    
    
  end
  
  print "         #         #\n"
  print "#" * 29
  print "\n         #         #\n"
  
  for i in (0..4) do 
    
    printRow(gameArray, 7, xsplit, osplit, number, i )
    
    print "#"
    printRow(gameArray, 8, xsplit, osplit, number, i )
    
    print "#"
    printRow(gameArray, 9, xsplit, osplit, number, i )
    
    print "\n"
    
    
  end
  print "\n"
end 

def printRow(gameArray, cell, xsplit, osplit, number, row)
  if gameArray[cell-1] == 0 
      temp = number % (cell)
      tempsplit = temp.split("\n")
      print tempsplit[row].center(9)
    elsif gameArray[cell-1] == 1 
      print osplit[row].center(9)
    else
      print xsplit[row].center(9)
    end
  
end 

def runGame(boardArray, osplit, xsplit, number)
  count =1
  
  
  printboard(boardArray, osplit, xsplit, number)
  while count <= 9 
  
    print "Enter a number to go (Q to quit): "
    spot = gets.chomp
    print "\n"
    if spot == "Q" || spot == "q"
      return playAgain 
    end 
    spot = spot.to_i
    check = 0
    while check == 0 
      if spot < 1 || spot > 9
        print "Error: spot chosen not in range. Please choose a number from 1 to 9 : "
        spot = gets.chomp 
        spot = spot.to_i
        print "\n"
      elsif boardArray[spot - 1] == 0
        count % 2 == 1 ? boardArray[spot - 1] = 2 : boardArray[spot-1 ] = 1
        check = 1
      else
        print  "Error, that spot has already been filled. Please choose another one: "
        spot = gets.chomp 
        spot = spot.to_i 
        print "\n"
        
      end 
    end 
    printboard(boardArray, osplit, xsplit, number)
    
    if winCheck(boardArray) == true
      return playAgain
    end 
      
    
    
    count += 1
  end 
  puts "Cat's Game. "
  return playAgain
end 


def winCheck(boardArray)
  i = 0 
  for i in 1..2 
    if [boardArray[0] , boardArray[1] , boardArray[2]].count(i) ==  3
      printWin(i)
      return true
    elsif [boardArray[3] , boardArray[4] , boardArray[5]].count(i) ==  3
      printWin(i)
      return true
    elsif [boardArray[6] , boardArray[7] , boardArray[8]].count(i) ==  3
      printWin(i)
      return true
    elsif [boardArray[0] , boardArray[3] , boardArray[6]].count(i) ==  3
      printWin(i)
      return true
    elsif [boardArray[1] , boardArray[4] , boardArray[7]].count(i) ==  3
      printWin(i)
      return true
    elsif [boardArray[2] , boardArray[5] , boardArray[8]].count(i) ==  3
      printWin(i)
      return true
    elsif [boardArray[0] , boardArray[4] , boardArray[8]].count(i) ==  3
      printWin(i)
      return true
    elsif [boardArray[2] , boardArray[4] , boardArray[6]].count(i) ==  3
      printWin(i)
      return true  
    
    end 
    
  end 
  

end 

def printWin(i) 
  if i == 1
    puts "Congratulations, O wins!"
  else 
    puts "Congratulations, X wins!"
  end 
  $score[i-1] +=1

end 

def playAgain()
  print  "Would you like to play again? Enter Y or N : "
  playGame = gets.chomp 
  if playGame == "Y" || playGame == "y"
    print "="* 80
    print "\n" + "Starting new Game! X : #{$score[1]} vs. O : #{$score[0]} " + "\n"
    print "=" * 80 + "\n\n\n"
    return true 
  elsif playGame == "N" || playGame == "n"
    print "="* 80
    print "\n" + "Thanks for playing!" + "\n"
    print "=" * 80 + "\n\n\n"
    return false
  else 
    puts "Error: Please enter Y or N"
    return playAgain
  end
end 



startText = "Tic-Tac-Toe as coded by TheSalientOne, at GitHub @ https://github.com/thesalientone"
print "="* 80
print "\n" + startText + "\n"
print "=" * 80 + "\n\n\n"
condition = runGame(boardArray, osplit, xsplit, number)

while condition == true 
  boardArray = Array.new(9,0)
  condition = runGame(boardArray, osplit, xsplit, number)
  
end 

