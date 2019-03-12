#' @title 
#' @description 
#' @inputs 
#' @return 

steph <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
klay <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
andre <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
kevin <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
draymond <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)

steph$name <- "Stephen Curry"
klay$name <- "Klay Thompson"
andre$name <- "Andre Iguodala"
kevin$name <- "Kevin Durant"
draymond$name <- "Draymond Green"

steph[steph$shot_made_flag == "n",'shot_made_flag'] <- "shot_no"
steph[steph$shot_made_flag == "y",'shot_made_flag'] <- "shot_yes"
klay[klay$shot_made_flag == "n",'shot_made_flag'] <- "shot_no"
klay[klay$shot_made_flag == "y",'shot_made_flag'] <- "shot_yes"
andre[andre$shot_made_flag == "n",'shot_made_flag'] <- "shot_no"
andre[andre$shot_made_flag == "y",'shot_made_flag'] <- "shot_yes"
kevin[kevin$shot_made_flag == "n",'shot_made_flag'] <- "shot_no"
kevin[kevin$shot_made_flag == "y",'shot_made_flag'] <- "shot_yes"
draymond[draymond$shot_made_flag == "n",'shot_made_flag'] <- "shot_no"
draymond[draymond$shot_made_flag == "y",'shot_made_flag'] <- "shot_yes"

steph$minute <- steph$period * 12 - steph$minutes_remaining
klay$minute <- klay$period * 12 - klay$minutes_remaining
andre$minute <- andre$period * 12 - andre$minutes_remaining
kevin$minute <- kevin$period * 12 - kevin$minutes_remaining
draymond$minute <- draymond$period * 12 - draymond$minutes_remaining

sink("../output/stephen-curry-summary.txt")
summary(steph)
sink()

sink("../output/klay-thompson-summary.txt")
summary(klay)
sink()

sink("../output/andre-iguodala-summary.txt")
summary(andre)
sink()

sink("../output/kevin-durant-summary.txt")
summary(kevin)
sink()

sink("../output/draymond-green-summary.txt")
summary(draymond)
sink()

main_table <- rbind(steph, rbind(klay, rbind(andre, rbind(kevin, draymond))))

write.csv(
  x = main_table,
  file = '../data/shots-data.csv'
)

sink("../output/shots-data-summary.txt")
summary(main_table)
sink()