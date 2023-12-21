Problems : Create Chattbot to recive Pizza order
# First Section Create Data for chattbot
#menu
    menu <- data.frame(id = 1:3,
    name = c("barbeque", "seafood", "paperoni"),
    price = c(180, 220, 250),
    unit = c(rep("Euro",3))
    )
#topping
    topping <- data.frame(id = 1:3,
    name = c("cheese", "suagsage", "No add topping"),
    price = c(30, 60, 0),
    unit = c(rep("Euro",3))
    )
#payment
    pay <- data.frame(id = 1:2,
    optional = c("cash","credit")
    )

# Chattbot loop
chat <- function(){
    cus <- readline("Name:" )
    print(paste("Pronto! Di Matteo Pizza", cus, "Please select the menu for order"))
    #bill total
    total_bill <- 0

    while(T){
    print("     MENU      ")
    print(menu[,1:4])
    flush.console()
    code <- as.numeric(readline(paste(cus,": " )))
    print("Please enter amount")
    flush.console()
    serve <- as.numeric(readline("amount:"))
    if (code == 1){
        print(paste("Pizza",menu[[1,2]],"amount", serve, "whole"))
        pizza_subtotal <- serve * menu[[1, 3]]
        total_bill <- total_bill + pizza_subtotal
    }else if(code == 2){
        print(paste("Pizza",menu[[2,2]],"amount", serve, "whole"))
        pizza_subtotal <- serve * menu[[2, 3]]
        total_bill <- total_bill + pizza_subtotal
    }else if(code == 3){
        print(paste("Pizza",menu[[3,2]],"amount", serve, "whole"))
        pizza_subtotal <- serve * menu[[3, 3]]
        total_bill <- total_bill + pizza_subtotal
    }else {
      print("Invalid menu.")
      next
    }
    print("topping selection")
    print("     TOPPING     ")
    print(topping[,1:4])
    flush.console()
    coe_top <-  as.numeric(readline(paste(cus,": ")))
    if (code == 1){
        print(paste("Add",topping[[1,2]]))
        topping_subtotal <- serve * topping[[1, 3]]
        total_bill <- total_bill + topping_subtotal
    }else if(code == 2){
        print(paste("Add",topping[[2,2]]))
        topping_subtotal <- serve * topping[[2, 3]]
        total_bill <- total_bill + topping_subtotal
    }else if(code == 3){
        print(paste("Add",topping[[3,2]]))
    }else {
      print("Invalid topping.")
      next
    }

    print("Do you have add order")
    print(  "Enter 1 = YES Enter 2 = NO")
    flush.console()
    choice <- as.numeric(readline(paste(cus,": ")))
    if (choice == 1) {
      print("Please select menu")
      TRUE
    } else if (choice == 2) {
      print("Total Bill:")
      print(paste("Total:", total_bill, "Euro"))
      break
    } else {
      print("Invalid input. Please enter 1 for YES or 2 for NO.")
      next
    }

}

    print("Selections payment")
    print(pay[,1:2])
    flush.console()
    pay_op <- as.numeric(readline(paste(cus,": ")))
    if (pay_op == 1){
        print(paste("payment: ", pay[[1,2]]))
    }else if (pay_op == 2){
        print(paste("payment: ", pay[[2,2]]))
        flush.console()
        namecre <- readline(paste("card name: "))
        cre <- readline(paste("card number: "))
        ccv <- readline(paste("ccv:"))
    }
    print("order confirme")
        print("Delivery within 30 minutes")
        print("Thank you :)")
}

chat()
