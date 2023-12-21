Problems : Create game rock paper scissor by loop until quite game

# game functions
game <- function(){
    flush.console()
    bot <- c("Rock", "Paper", "Scissor")
    userscore <- 0
    botscore <- 0

    while(TRUE){
        flush.console()
        user_hand <- readline("Choose Rock Paper or Scissor:" )
        print(paste("User Hand:",user_hand))

    #quite game
    if  (user_hand == "Quite") {
        print("Bye! see you again")
        break
    }
    #sumscore
    if (user_hand == "sum score"){
            print(paste("user score: ", userscore))
            print(paste("bot score: ", botscore))
            next
    }
    #invalid input
    if  (user_hand != "Rock" && user_hand != "Paper" && user_hand != "Scissor"){
        print("Invalid input Please choose from Rock, Paper, or Scissor.")
        next
    }
        bot_hand <- sample(bot,1)
        print(paste("Bot Hand:",bot_hand))
    #game loop
    #Draw
    if  (user_hand == bot_hand)
        {
        print("Draw")
        print(paste("userscore:",userscore))
        print(paste("botscore:",botscore))
    #user win
     } else if  ((user_hand == "Rock" & bot_hand == "Scissor") ||
                (user_hand == "Paper" & bot_hand == "Rock") ||
                (user_hand == "Scissor" & bot_hand == "Paper")){
                print("Win")
                userscore = userscore + 1
                print(paste("userscore:",userscore))
                print(paste("botscore:",botscore))
    #bot win
    } else if  ((user_hand == "Rock" & bot_hand == "Paper") ||
                (user_hand == "Scissor" & bot_hand == "Rock") ||
                (user_hand == "Paper" & bot_hand == "Scissor")){
                print("Lose")
                userscore = userscore + 1
                print(paste("userscore:",userscore))
                print(paste("botscore:",botscore))
    }
    }
}

#Interface
start <- function(){
   flush.console()
   name <- readline("username:" )
   while (TRUE) {
    flush.console()
    pass <- as.integer(readline("password: "))
    if (pass == 7412) {
      print(paste("Hi! Welcome", name, "to the Rock-Paper-Scissors Game")) # Intro to the game
      game()
      break
    } else {
      print("Password is wrong!")  # If password is worng
    }
    }
}

start()
