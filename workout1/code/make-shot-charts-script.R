#' @title Create Shot Charts
#' @description This script uses the data created in make-shots-data-script.R to display the data as shot charts, and to write the charts to PDF files.
#' @inputs Shot data for each of the players
#' @return PDF files of each of the player's shot charts

library(ggplot2)
library(jpeg)
library(grid)

shots_data <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))


pdf(file = "../images/klay-thompson-shot-chart.pdf", width=6.5, height=5)
ggplot(data = shots_data[shots_data$name == "Klay Thompson",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf", width=6.5, height=5)
ggplot(data = shots_data[shots_data$name == "Draymond Green",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf", width=6.5, height=5)
ggplot(data = shots_data[shots_data$name == "Stephen Curry",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf", width=6.5, height=5)
ggplot(data = shots_data[shots_data$name == "Kevin Durant",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/andre-iguodala-shot-chart.pdf", width=6.5, height=5)
ggplot(data = shots_data[shots_data$name == "Andre Iguodala",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/gsw-shot-charts.pdf", width=8, height=7)
ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  facet_wrap(~ name) +
  theme_minimal()
dev.off()

jpeg(file = "../images/gsw-shot-charts.jpg", width=800, height=700)
ggplot(data = shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  facet_wrap(~ name) +
  theme_minimal()
dev.off()
