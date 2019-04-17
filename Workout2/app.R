#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Annual Growth of Principle over Different Forms of Saving"),
   
   # Sidebar with a slider input for number of bins 
   fluidRow(
     
     column(4, sliderInput("initial",
                           "Initial Amount:",
                           min = 1,
                           max = 100000,
                           value = 1000),
              sliderInput("contrib",
                          label = "Annual Contribution:",
                          min = 0,
                          max = 50000,
                          value = 2000)),
     
     column(4, sliderInput("return",
                           label = "Return Rate (in %):",
                           min = 0,
                           max = 20,
                           value = 5),
              sliderInput("growth",
                          label = "Growth Rate (in %):",
                          min = 0,
                          max = 20,
                          value = 2)),
     
     column(4, sliderInput("years",
                            "Years",
                            min = 0,
                            max = 50,
                            value = 20),
               selectInput("facet", 
                            label = "Facet?", 
                            choices = list("Yes" = 1, "No" = 2), 
                            selected = 2))
     ),
      # Show a plot of the generated distribution
      column(12,
         hr(),
         h4("Timelines"),
         plotOutput("distPlot"),
         div(),
         h4("Balances"),
         dataTableOutput("table")
      )
   )

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     no_contrib <- c()
     fixed_contrib <- c()
     growing_contrib <- c()
     
     for (i in 0:input$years) {
       none <- future_value(input$initial, input$return/100, i)
       fixed <- none + annuity(input$contrib, input$return/100, i)
       growing <- none + growing_annuity(input$contrib, input$return/100, input$growth/100, i)
       no_contrib <- c(no_contrib, none)
       fixed_contrib <- c(fixed_contrib, fixed)
       growing_contrib <- c(growing_contrib, growing)
     }
     
     modalities <- data.frame(years = 0:input$years, no_contrib = no_contrib, fixed_contrib = fixed_contrib, growing_contrib = growing_contrib)
     melted = melt(modalities, id.vars="years")
     
     if (input$facet == 1) {
       ggplot() + geom_area(data=melted, aes(x=years, y=value, group=variable, color=variable, fill=variable), alpha=0.5) + geom_line(data=melted, aes(x=years, y=value, group=variable, color=variable)) + geom_point(data=melted, aes(x=years, y=value, group=variable, color=variable)) + facet_wrap(~ variable) + ggtitle("Three Modes of Investing")
     } else {
       ggplot(data=melted, aes(x=years, y=value, group=variable, color=variable)) + geom_line() + geom_point(data=melted, aes(x=years, y=value, group=variable, color=variable)) + ggtitle("Three Modes of Investing")
     } })
   
   output$table <- renderDataTable({no_contrib <- c()
   fixed_contrib <- c()
   growing_contrib <- c()
   
   for (i in 0:input$years) {
     none <- future_value(input$initial, input$return/100, i)
     fixed <- none + annuity(input$contrib, input$return/100, i)
     growing <- none + growing_annuity(input$contrib, input$return/100, input$growth/100, i)
     no_contrib <- c(no_contrib, none)
     fixed_contrib <- c(fixed_contrib, fixed)
     growing_contrib <- c(growing_contrib, growing)
   }
   
   modalities <- data.frame(years = 0:input$years, no_contrib = no_contrib, fixed_contrib = fixed_contrib, growing_contrib = growing_contrib)
   modalities})
}

#' @title Future Value
#' @description Calculates the expected return over a certain amount of years given a starting principle and an annual rate, without taking into account inflation
#' @param amount Starting Principle Amount (numeric)
#' @param rate Annual rate of return (numeric)
#' @param years Amount of years to calculate interest for (numeric)
#' @return Expected total value after a set number of years compounding at a set rate (numeric)
future_value <- function(amount, rate, years) {
  mult_const <- (1 + rate)^years
  return (amount * mult_const)
}

#' @title Future Value of Annuity
#' @description Calculates the expected future value of annuity given an annual contribution along with the annual rate of return and the amount of years to calculate
#' @param contrib Amount deposited at the end of each year (numeric)
#' @param rate Annual rate of return (numeric)
#' @param years Amount of years to calculate future value of annuity for (numeric)
#' @return Expected total value of annuity (numeric)
annuity <- function(contrib, rate, years) {
  mult_const <- ((1 + rate)^years - 1) / rate
  return(contrib * mult_const)
}

#' @title Future Value of Growing Annuity
#' @description Calculates the expected future value of annuity given a growing annual contribution along with the annual rate of return and the amount of years to calculate
#' @param contrib Amount deposited at the end of each year (numeric)
#' @param rate Annual rate of return (numeric)
#' @param growth Annual rate of growth of annual contribution (numeric)
#' @param years Amount of years to calculate future value of growing annuity for (numeric)
#' @return Expected total value of growing annuity (numeric)
growing_annuity <- function(contrib, rate, growth, years) {
  mult_const <- ((1 + rate)^years - (1 + growth)^years) / (rate - growth)
  return(contrib * mult_const)
}



# Run the application 
shinyApp(ui = ui, server = server)

